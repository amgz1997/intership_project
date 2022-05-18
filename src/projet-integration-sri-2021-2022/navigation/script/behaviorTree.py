#! /usr/bin/env python

import functools
import py_trees as pt 
import py_trees_ros as ptr
import py_trees.console as console
import rospy
import sys
import geometry_msgs.msg as geometry_msgs
import numpy as np 
import time 
import tf2_ros
import tf2_geometry_msgs 
import cv2
import moveit_commander
import moveit_msgs.msg  
from cv_bridge import CvBridge 
import move_base_msgs.msg as mb_msgs
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal, MoveBaseActionFeedback, MoveBaseActionGoal 
from actionlib_msgs.msg import GoalStatus
from actionlib import SimpleActionClient
from geometry_msgs.msg import PoseStamped, Pose, PoseArray, Vector3Stamped, Vector3, Quaternion 
from aruco_msgs.msg import Marker
from aruco_msgs.msg import MarkerArray
from play_motion_msgs.msg import PlayMotionAction, PlayMotionGoal
from moveit_msgs.msg import Grasp, PickupAction, PickupGoal, PickupResult, MoveItErrorCodes
from moveit_msgs.msg import PlaceAction, PlaceGoal, PlaceResult, PlaceLocation, MoveItErrorCodes 
from moveit_msgs.srv import GetPlanningScene, GetPlanningSceneRequest, GetPlanningSceneResponse
from copy import deepcopy
from random import shuffle
from std_srvs.srv import Empty, EmptyRequest
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal 
from trajectory_msgs.msg import JointTrajectoryPoint, JointTrajectory
from navigation.msg import PickUpPoseAction, PickUpPoseGoal 
from spherical_grasps_server import SphericalGrasps


class movebase(pt.behaviour.Behaviour):

    def __init__(self,pose):
        
        rospy.loginfo('Initialisiation move base ')
        rospy.loginfo("waiting for /move_base actin server")
        self.client=SimpleActionClient('move_base', MoveBaseAction)

        if not self.client.wait_for_server():

            rospy.loginfo("Connexion to move_base server  failed ")
            exit()

        rospy.loginfo("Connected to /move_base server success")

        super(movebase,self).__init__("Move_Base ")  
        self.pose=pose 
        self.at_position=False
        self.bb=pt.blackboard.Blackboard() 

    def update(self):

      if self.pose=="point1":

        goals=self.create_goal(-0.2, 0.8, -1.0)
        self.client.send_goal(goals)

      elif self.pose=="point2":

        goals=self.create_goal(0.0, 0.0, 1.0)

        self.client.send_goal(goals)

      #self.at_position=True
      success=self.client.wait_for_result()
      status=self.client.get_state()

      if not success:

          return pt.common.Status.FAILURE

      if success:

          return pt.common.Status.SUCCESS   

    #   if status==GoalStatus.SUCCEEDED:
    #        return pt.common.Status.SUCCESS
    #   if status==GoalStatus.ACTIVE:
    #        return pt.common.Status.RUNNING  
    #   else : 
    #        return pt.common.Status.FAILURE

    def terminate(self,new_status):

       self.bb.set("target_pose",None)

    def create_goal(self,x,y,w):

        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = x
        goal.target_pose.pose.position.y = y
        goal.target_pose.pose.position.z = 0.0
        goal.target_pose.pose.orientation.x = 0.0
        goal.target_pose.pose.orientation.y = 0.0
        goal.target_pose.pose.orientation.z = 0.0
        goal.target_pose.pose.orientation.w = w
        
        return goal 

class aruco_detect(pt.behaviour.Behaviour):

    def __init__(self):

        rospy.sleep(2.0)
        rospy.loginfo("Waiting for Aruco detection  ")

        self.last_call=time.time()

        self.aruco_pose=rospy.Subscriber('/aruco_single/pose',PoseStamped,self.aruco_cb) #Utiliser unwait_for_server

        self.aruco_verif=False 

        super(aruco_detect,self).__init__("Aruco_detection")

    def update(self):

        rospy.sleep(1)

        if self.aruco_verif:
           # self.feedback_mess
            return pt.common.Status.SUCCESS #Try pt.Status.SUCCESS??
       
        if abs(self.last_call-time.time())>0.5:

            rospy.loginfo("Aruco not detected")
            self.aruco_verif=False
            return pt.common.Status.FAILURE

        else:

            rospy.loginfo(" Aruco detected")
            self.aruco_verif=True
            return pt.common.Status.SUCCESS

    def aruco_cb(self,data):

        self.aruco_pos=data
        self.last_call=time.time()


class arm_tucking(pt.behaviour.Behaviour):

    def __init__(self,config):

        self.config=config
        
        self.arm_ac=SimpleActionClient('/safe_arm_controller/follow_joint_trajectory', FollowJointTrajectoryAction) #JointTrajectory
        self.arm_ac.wait_for_server()

        rospy.loginfo("connected to /arm_controller")
        rospy.loginfo("Connected!")

        self.sent_goal=False
        
        super(arm_tucking, self).__init__("Tucking_Arm")

    def update(self):

        if self.config=="config1":
            
            #mov_torso=self.torso_mov(0.30)
            #mov_joint=self.joint_mov(0.21, 0.35, -0.2, 2.0, -1.57, 1.52, 0.0) #final

            mov_joint=self.joint_mov(0.21, -1.34, -0.2, 1.94, -1.57, 1.37, 0.0) #initial

        elif self.config=="config2":
            
            #rospy.sleep(25)

            mov_torso=self.torso_mov(0.25)
            mov_joint=self.joint_mov(0.21, -0.2, -2.2, 1.15 ,-1.57, 0.2, 0.0)

        if self.sent_goal:

            return pt.common.Status.FAILURE

        else:

            return pt.common.Status.SUCCESS

    def joint_mov(self,arm1,arm2,arm3,arm4,arm5,arm6,arm7):

        jt=JointTrajectory()
        jt.joint_names=['arm_1_joint', 'arm_2_joint', 'arm_3_joint', 'arm_4_joint', 'arm_5_joint', 'arm_6_joint', 'arm_7_joint']
        jtp=JointTrajectoryPoint()
        jtp.positions =[arm1, arm2, arm3, arm4, arm5, arm6, arm7]
        jtp.time_from_start = rospy.Duration(10)
        arm_goal_pos=FollowJointTrajectoryGoal()
        jt.points.append(jtp)
        arm_goal_pos.trajectory=jt
        arm_goal_pos.goal_time_tolerance=rospy.Duration(0)
        self.arm_ac.send_goal(arm_goal_pos)
        rospy.loginfo("goal send success")
        self.arm_ac.wait_for_result()

class torso_tucking(pt.behaviour.Behaviour):

    def __init__(self,config):

        self.config=config
        
        self.torso_ac=SimpleActionClient('/safe_torso_controller/follow_joint_trajectory', FollowJointTrajectoryAction) #JointTrajectory
        self.torso_ac.wait_for_server()

        rospy.loginfo("connected to /torso_controller")
        rospy.loginfo("Connected!")

        self.sent_goal=False
        
        super(torso_tucking, self).__init__("Tucking_torso")

    def update(self):

        if self.config=="config1":
            
            mov_torso=self.torso_mov(0.34)
            
            #rospy.sleep(25)

        elif self.config=="config2":
            
            #rospy.sleep(25)

            mov_torso=self.torso_mov(0.25)

        if self.sent_goal:

            return pt.common.Status.FAILURE

        else:

            return pt.common.Status.SUCCESS

    def torso_mov(self,tors):

        tor=JointTrajectory()
        tor.joint_names=['torso_lift_joint']
        tor_p=JointTrajectoryPoint()
        tor_p.positions =[tors]
        tor_p.time_from_start = rospy.Duration(7)
        torso_goal_pos=FollowJointTrajectoryGoal()
        tor.points.append(tor_p)
        torso_goal_pos.trajectory=tor
        torso_goal_pos.goal_time_tolerance=rospy.Duration(0)
        self.torso_ac.send_goal(torso_goal_pos)
        rospy.loginfo("goal send success")
        self.torso_ac.wait_for_result()
 

class pick_place(pt.behaviour.Behaviour):

    def __init__(self):

        rospy.loginfo(" Init pick and place ")
        self.sg = SphericalGrasps()
        rospy.loginfo("Connecting to pickup AS")
        self.pickup_ac = SimpleActionClient('/pickup', PickupAction)
        self.pickup_ac.wait_for_server()
        rospy.loginfo("Succesfully connected.")
        rospy.loginfo("Connecting to place AS")
        self.place_ac = SimpleActionClient('/place', PlaceAction)
        self.place_ac.wait_for_server()
        rospy.loginfo("Succesfully connected.")
        self.scene = PlanningSceneInterface()
        rospy.loginfo("Connecting to /get_planning_scene service")
        self.scene_srv = rospy.ServiceProxy('/get_planning_scene', GetPlanningScene)
        self.scene_srv.wait_for_service()
        rospy.loginfo("Connected.")

        # Get the object size
		# self.object_height = rospy.get_param('~object_height')
		# self.object_width = rospy.get_param('~object_width')
		# self.object_depth = rospy.get_param('~object_depth')
		# Get the links of the end effector exclude from collisions

        self.links_to_allow_contact = ["gripper_left_finger_lnk", "gripper_right_finger_link", "gripper_link"]
        if self.links_to_allow_contact is None:

            rospy.logwarn("Didn't find any links to allow contacts... at param ~links_to_allow_contact")
        else:
            rospy.loginfo("Found links to allow contacts: " + str(self.links_to_allow_contact))

        self.pick_as = SimpleActionServer('/pickup_pose', PickUpPoseAction,execute_cb=self.pick_cb, auto_start=False)
        self.pick_as.start()

        self.place_as = SimpleActionServer('/place_pose', PickUpPoseAction, execute_cb=self.place_cb, auto_start=False)
        self.place_as.start()

        rospy.loginfo("Connecting to clear octomap service...")
        self.clear_octomap_srv = rospy.ServiceProxy('/clear_octomap', Empty)
        self.clear_octomap_srv.wait_for_service()
        rospy.loginfo("Connected!")
        self.bridge=CvBridge()
        self.tfBuffer=tf2_ros.Buffer()
        self.tf_l=tf2_ros.TransformListener(self.tfBuffer)
        rospy.loginfo("wait /pickup")

        self.pick_as=SimpleActionClient('/pickup_pose',PickupAction)
        self.pick_as.wait_for_server()
        rospy.loginfo("connect to /pickup_pose server")

        self.place_as=SimpleActionClient('/place_pose',PlaceAction)
        self.pick_as.wait_for_server()
        rospy.loginfo("connect to /pickup_pose server")

        self.detected_pose_pub=rospy.Publisher('/detected_aruco_pose',PoseStamped,queue_size=1,latch=True)

        self.pick_place_goal=False

        super(pick_place, self).__init__("pick_place")   

    def update(self):
            
        Pick=self.pick_aruco("pick")
        Place=self.place()

        if self.pick_place_goal:

            return pt.common.Status.FAILURE

        else:

            return pt.common.Status.SUCCESS

    def strip_leading_slash(self,s):

        return s[1:] if s.startswith("/") else s

    def pick_aruco(self,operator):

        aruco_pose=rospy.wait_for_message('/aruco_single/pose',PoseStamped) #Utiliser unwait_for_server
        aruco_pose.header.frame_id=self.strip_leading_slash(aruco_pose.header.frame_id)
        
        rospy.loginfo("Got :"+str(aruco_pose))

        rospy.loginfo("spherical_grasp_gui: Transforming frame:" + aruco_pose.header.frame_id + " to 'base_footprint' ")
        
        ps=PoseStamped()

        ps.pose.position=aruco_pose.pose.position   
        ps.header.stamp=self.tfBuffer.get_latest_common_time("base_footprint", aruco_pose.header.frame_id) 
        ps.header.frame_id=aruco_pose.header.frame_id
        transform_ok= False

        while not transform_ok :
            try:
                transform=self.tfBuffer.lookup_transform("base_footprint",ps.header.frame_id,rospy.Time(0))
                aruco_ps=tf2_geometry_msgs.do_transform_pose(ps, transform)
                transform_ok=True

            except tf2_ros.ExtrapolationException as e:

                rospy.logwarn("Exception on transforming point ... trying again \n ("+ str(e)+")")    
                rospy.sleep(0.1)
                ps.header.stamp=self.tfBuffer.get_latest_common_time("base_footprint", aruco_pose.header.frame_id) 
           
            pick_g=PickupGoal()    

        if operator=="pick":

            rospy.loginfo("Setting object pose based on Aruco detection")
            pick_g.pose.position= aruco_ps.pose.position
            pick_g.pose.position.z -= 0.1*0.5

            rospy.loginfo("aruco pose in base footprint:" + str(pick_g))

            pick_g.header.frame_id= 'base_footprint'
            pick_g.pose.orientation.w= 1.0
            self.detected_pose_pub.publish(pick_g.pose)
            rospy.loginfo(" Go to pick :" + str(pick_g))
            self.pick_as.send_goal(pick_g)
            rospy.loginfo("Done !")
            resut=self.pick_as.get_result()

            if str(moveit_error_dict[result.error_code]) != "Success":

                rospy.logerror("Failled to pick trying further")

                return

    def place_aruco(self):

        rospy.sleep(5)
        pick_g.object_pose.pose.position.z=0.05    
        self.place_as.send_goal_and_wait(pick_g)
        rospy.loginfo("Obejct placed ")

    def createPickupGoal(group="arm_torso", target="part", grasp_pose=PoseStamped(), possible_grasps=[], links_to_allow_contact=None):
        """ Create a PickupGoal with the provided data"""
        pug = PickupGoal()
        pug.target_name = target
        pug.group_name = group
        pug.possible_grasps.extend(possible_grasps)
        pug.allowed_planning_time = 35.0
        pug.planning_options.planning_scene_diff.is_diff = True
        pug.planning_options.planning_scene_diff.robot_state.is_diff = True
        pug.planning_options.plan_only = False
        pug.planning_options.replan = True
        pug.planning_options.replan_attempts = 1  # 10
        pug.allowed_touch_objects = []
        pug.attached_object_touch_links = ['<octomap>']
        pug.attached_object_touch_links.extend(links_to_allow_contact)

        return pug

    def createPlaceGoal(place_pose, place_locations, group="arm_torso", target="part", links_to_allow_contact=None):

        """Create PlaceGoal with the provided data"""
        placeg = PlaceGoal()
        placeg.group_name = group
        placeg.attached_object_name = target
        placeg.place_locations = place_locations
        placeg.allowed_planning_time = 15.0
        placeg.planning_options.planning_scene_diff.is_diff = True
        placeg.planning_options.planning_scene_diff.robot_state.is_diff = True
        placeg.planning_options.plan_only = False
        placeg.planning_options.replan = True
        placeg.planning_options.replan_attempts = 1
        placeg.allowed_touch_objects = ['<octomap>']
        placeg.allowed_touch_objects.extend(links_to_allow_contact)

        return placeg

    def pick_cb(self, goal):
        """
        :type goal: PickUpPoseGoal
        """
        error_code = self.grasp_object(goal.object_pose)
        p_res = PickUpPoseResult()
        p_res.error_code = error_code
        if error_code != 1:
            self.pick_as.set_aborted(p_res)
        else:
            self.pick_as.set_succeeded(p_res)

    def place_cb(self, goal):
        """
        :type goal: PickUpPoseGoal
        """
        error_code = self.place_object(goal.object_pose)
        p_res = PickUpPoseResult()
        p_res.error_code = error_code
        if error_code != 1:
            self.place_as.set_aborted(p_res)
        else:
            self.place_as.set_succeeded(p_res)

    def wait_for_planning_scene_object(self, object_name='part'):

        rospy.loginfo("Waiting for object '" + object_name + "'' to appear in planning scene...")
        gps_req = GetPlanningSceneRequest()
        gps_req.components.components = gps_req.components.WORLD_OBJECT_NAMES
        part_in_scene = False
        while not rospy.is_shutdown() and not part_in_scene:
            # This call takes a while when rgbd sensor is set
            gps_resp = self.scene_srv.call(gps_req)
            # check if 'part' is in the answer
            for collision_obj in gps_resp.scene.world.collision_objects:
                if collision_obj.id == object_name:
                    part_in_scene = True
                    break
            else:
                rospy.sleep(1.0)

        rospy.loginfo("'" + object_name + "'' is in scene!")

    def grasp_object(self, object_pose):

        rospy.loginfo("Removing any previous 'part' object")
        # self.scene.remove_attached_object("arm_tool_link")
        # self.scene.remove_world_object("part")
        # self.scene.remove_world_object("table")
        rospy.loginfo("Clearing octomap")
        self.clear_octomap_srv.call(EmptyRequest())
        rospy.sleep(2.0)  # Removing is fast
        rospy.loginfo("Adding new 'part' object")

        rospy.loginfo("Object pose: %s", object_pose.pose)
        
        #Add object description in scene
        #self.scene.add_box("part", object_pose, (self.object_depth, self.object_width, self.object_height))

        # rospy.loginfo("Second%s", object_pose.pose)
        # table_pose = copy.deepcopy(object_pose)

        # #define a virtual table below the object
        # table_height = object_pose.pose.position.z - self.object_width/2  
        # table_width  = 1.8
        # table_depth  = 0.5
        # table_pose.pose.position.z += -(2*self.object_width)/2 -table_height/2
        # table_height -= 0.008 #remove few milimeters to prevent contact between the object and the table
        #self.scene.add_box("table", table_pose, (table_depth, table_width, table_height))

        # # We need to wait for the object part to appear
        self.wait_for_planning_scene_object()
        #self.wait_for_planning_scene_object("table")

        # compute grasps

        possible_grasps = self.sg.create_grasps_from_object_pose(object_pose)
        self.pickup_ac
        goal = createPickupGoal("arm_torso", "part", object_pose, possible_grasps, self.links_to_allow_contact)
        rospy.loginfo("Sending goal")
        self.pickup_ac.send_goal(goal)
        rospy.loginfo("Waiting for result")
        self.pickup_ac.wait_for_result()
        result = self.pickup_ac.get_result()
        rospy.logdebug("Using torso result: " + str(result))
        rospy.loginfo("Pick result: " + str(moveit_error_dict[result.error_code.val]))

        return result.error_code.val

	def place_object(self, object_pose):

		rospy.loginfo("Clearing octomap")
		self.clear_octomap_srv.call(EmptyRequest())
		possible_placings = self.sg.create_placings_from_object_pose(object_pose)
		# Try only with arm
		rospy.loginfo("Trying to place using only arm")
		goal = createPlaceGoal(object_pose, possible_placings, "arm", "part", self.links_to_allow_contact)
		rospy.loginfo("Sending goal")
		self.place_ac.send_goal(goal)
		rospy.loginfo("Waiting for result")
		self.place_ac.wait_for_result()
		result = self.place_ac.get_result()
		rospy.loginfo(str(moveit_error_dict[result.error_code.val]))

		if str(moveit_error_dict[result.error_code.val]) != "SUCCESS":
			rospy.loginfo("Trying to place with arm and torso")
			# Try with arm and torso
			goal = createPlaceGoal(object_pose, possible_placings, "arm_torso", "part", self.links_to_allow_contact)
			rospy.loginfo("Sending goal")
			self.place_ac.send_goal(goal)
			rospy.loginfo("Waiting for result")
			self.place_ac.wait_for_result()
			result = self.place_ac.get_result()
			rospy.logerr(str(moveit_error_dict[result.error_code.val]))

        # print result

		rospy.loginfo("Result: " +str(moveit_error_dict[result.error_code.val]))
		rospy.loginfo("Removing previous 'part' object")
		self.scene.remove_world_object("part")

		return result.error_code.val


class BehaviourTree(ptr.trees.BehaviourTree):

    def __init__(self):

        rospy.loginfo("Initialising behaviour tree")

        Nav1=movebase("point1")
        Nav2=movebase("point2")
        Detect=aruco_detect()
        Arm_tucking1=arm_tucking("config1")
        Arm_tucking2=arm_tucking("config2")
        Torso_tucking1=torso_tucking("config1")
        Torso_tucking2=torso_tucking("config2")
        PickPlace=pick_place()
        root=pt.composites.Sequence(name="Task")

       # root.add_children([Nav1,Detect,Arm_tucking1,Torso_tucking1,Nav2]) ##Revoir l'aruco detecte ??
        
        root.add_children([Arm_tucking1])

        super(BehaviourTree, self).__init__(root)

        rospy.sleep(5)

        self.setup(timeout=15)

        while not rospy.is_shutdown(): self.tick_tock(1)
        
        rospy.is_shutdown()

if __name__ == '__main__':

        rospy.init_node('behavior_tree')
        
        try:

            BehaviourTree()

        except rospy.ROSInterruptException:

            pass

       # rospy.spin()         
          

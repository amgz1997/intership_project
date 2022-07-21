#! /usr/bin/env python
# -*- coding:utf-8 -*-

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
import move_base_msgs.msg as mb_msgs
from cv_bridge import CvBridge 
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal, MoveBaseActionFeedback, MoveBaseActionGoal 
from actionlib_msgs.msg import GoalStatus
from actionlib import SimpleActionClient, SimpleActionServer
from geometry_msgs.msg import PoseStamped, Pose, PoseArray, Vector3Stamped, Vector3, Quaternion 
from play_motion_msgs.msg import PlayMotionAction, PlayMotionGoal
from moveit_commander import PlanningSceneInterface
from moveit_msgs.msg import Grasp, PickupAction, PickupGoal, PickupResult, MoveItErrorCodes
from moveit_msgs.msg import PlaceAction, PlaceGoal, PlaceResult, PlaceLocation, MoveItErrorCodes 
from moveit_msgs.srv import GetPlanningScene, GetPlanningSceneRequest, GetPlanningSceneResponse
from copy import deepcopy
from random import shuffle
from std_srvs.srv import Empty, EmptyRequest
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal 
from trajectory_msgs.msg import JointTrajectoryPoint, JointTrajectory
from navigation.msg import PickUpPoseAction, PickUpPoseGoal, PickUpPoseResult, PickUpPoseFeedback 
from spherical_grasps_server import SphericalGrasps


class movebase(pt.behaviour.Behaviour):

    def __init__(self,pose):
        
        rospy.loginfo('Initialisiation move base ')
        rospy.loginfo("waiting for /move_base actin server")
        self.client=SimpleActionClient('move_base', MoveBaseAction) #connect to server with a client 

        if not self.client.wait_for_server():

            rospy.loginfo("Connexion to move_base server  failed ")
            exit()

        rospy.loginfo("Connected to /move_base server success")

        super(movebase,self).__init__("Navigation")  #Init the class 
        self.pose=pose 
        self.at_position=False
        self.bb=pt.blackboard.Blackboard() 

    def update(self):

      if self.pose=="point1":

        goals=self.create_goal(-0.61, -0.139, 1.0) #Create the first point with function create_goal
        self.client.send_goal(goals) #send goal 1  


      elif self.pose=="point2":

        goals=self.create_goal(-0.78, -2.31, 1.0) #Create the first point with function create_goal

        self.client.send_goal(goals) #send goal 2

      #self.at_position=True
      success=self.client.wait_for_result() # See the status of the goal 
      status=self.client.get_state() #See the state of the goal 

      if not success:
          return pt.common.Status.FAILURE #Behvaior status  for no success

      if success:

          return pt.common.Status.SUCCESS   #Behvaior status  for  successs

    def terminate(self,new_status):

       self.bb.set("target_pose",None)

    def create_goal(self,x,y,w):

        #create a goal (x,y,z)
        Goal = MoveBaseGoal() #See move_base_msgs.msg
        Goal.target_pose.header.frame_id = "map"
        Goal.target_pose.header.stamp = rospy.Time.now()
        Goal.target_pose.pose.position.x = x
        Goal.target_pose.pose.position.y = y
        Goal.target_pose.pose.position.z = 0.0
        Goal.target_pose.pose.orientation.x = 0.0
        Goal.target_pose.pose.orientation.y = 0.0
        Goal.target_pose.pose.orientation.z = 0.0
        Goal.target_pose.pose.orientation.w = w
        
        return Goal 

class aruco_detect(pt.behaviour.Behaviour):

    def __init__(self):

        rospy.sleep(2.0)
        rospy.loginfo("Waiting for Aruco detection  ")

        self.last_call=time.time()
        self.aruco_pose=rospy.Subscriber('/aruco_single/pose',PoseStamped,self.aruco_cb) #Subscribe to  topic  

        self.aruco_verif=False 

        super(aruco_detect,self).__init__("Aruco_detection") #Init the class 

    def update(self):

        rospy.sleep(1)

        if self.aruco_verif:
            return pt.common.Status.SUCCESS # Behvaior status  for  success
     
        # Return a loginfo in 0.5 s if the aruco is not detected with callback
        if abs(self.last_call-time.time())>0.5:

            rospy.loginfo("Aruco not detected")
            self.aruco_verif=False
            return pt.common.Status.FAILURE #Behvaior status  for no success

        else:

            rospy.loginfo(" Aruco detected")
            self.aruco_verif=True
            return pt.common.Status.SUCCESS #Behvaior status  for  success

    def aruco_cb(self,data):

        self.aruco_pos=data
        self.last_call=time.time()


class arm_tucking(pt.behaviour.Behaviour):

    def __init__(self,config):

        self.config=config 
        self.arm_ac=SimpleActionClient('/safe_arm_controller/follow_joint_trajectory', FollowJointTrajectoryAction) #Connect to server with a client 
        self.arm_ac.wait_for_server() #wait server 
        rospy.loginfo("connected to /arm_controller")

        self.sent_goal=False
        
        super(arm_tucking, self).__init__("Tucking_Arm")

    def update(self):

        if self.config=="config1":
            mov_joint=self.joint_mov(0.05, -0.07, -3.0, 1.5, -1.57, 0.2, 0.1) #Pose for grasping
           # mov_joint=self.joint_mov(0.20, -0.1, -2.0, 1.5, -0.2, 0.2, 0.0) #for testing # First position of the joints

        elif self.config=="config2":
            mov_joint=self.joint_mov(0.2, -1.34, -0.2, 1.94, -1.57, 1.37, 0.0) #safe pose  # Second position of the joints

        if self.sent_goal:
            return pt.common.Status.FAILURE #Behvaior status  for no success


        else:

            return pt.common.Status.SUCCESS #Behvaior status  for  success


    def joint_mov(self,arm1,arm2,arm3,arm4,arm5,arm6,arm7):

        #create the movement for the joint 

        jt=JointTrajectory() #See trajectory_msg.msg
        jt.joint_names=['arm_1_joint', 'arm_2_joint', 'arm_3_joint', 'arm_4_joint', 'arm_5_joint', 'arm_6_joint', 'arm_7_joint'] #Define the joint 
        jtp=JointTrajectoryPoint() #See trajectory_msg.msg
        jtp.positions =[arm1, arm2, arm3, arm4, arm5, arm6, arm7] #Define the point 
        jtp.time_from_start = rospy.Duration(5)
        arm_goal_pos=FollowJointTrajectoryGoal() #See control_msg.msg
        jt.points.append(jtp) #Add the point of the joint 
        arm_goal_pos.trajectory=jt
        arm_goal_pos.goal_time_tolerance=rospy.Duration(1)
        self.arm_ac.send_goal(arm_goal_pos) #Send the position to reach by each joint 
        rospy.loginfo("goal send success")
        self.arm_ac.wait_for_result() #wait the result 

class torso_tucking(pt.behaviour.Behaviour):

    def __init__(self,config):

        self.config=config
        
        self.torso_ac=SimpleActionClient('/safe_torso_controller/follow_joint_trajectory', FollowJointTrajectoryAction) #JointTrajectory
        self.torso_ac.wait_for_server()

        rospy.loginfo("connected to /torso_controller")
        rospy.loginfo("Connected!")

        self.sent_goal=False
        
        super(torso_tucking, self).__init__("Tucking_torso") #Init the class 

    def update(self):

        if self.config=="config1":
            mov_torso=self.torso_mov(0.35) # First position of the torso
            
        elif self.config=="config2":         
            mov_torso=self.torso_mov(0.25) # Second position of the torso

        if self.sent_goal:
            return pt.common.Status.FAILURE  #Behvaior status  for no success

        else:

            return pt.common.Status.SUCCESS  #Behvaior status  for  success

    def torso_mov(self,tors):
        
        #create the movement for the torso
        tor=JointTrajectory() #See trajectory_msg.msg
        tor.joint_names=['torso_lift_joint'] #Define the joint 
        tor_p=JointTrajectoryPoint() #See trajectory_msg.msg
        tor_p.positions =[tors]  #Define the point
        tor_p.time_from_start = rospy.Duration(7)
        torso_goal_pos=FollowJointTrajectoryGoal() #See control_msg.msg
        tor.points.append(tor_p) #Add the point of the joint 
        torso_goal_pos.trajectory=tor
        torso_goal_pos.goal_time_tolerance=rospy.Duration(0)
        self.torso_ac.send_goal(torso_goal_pos) #Send the position to reach by each joint
        rospy.loginfo("goal send success")
        self.torso_ac.wait_for_result() #wait the result 

class lower_head(pt.behaviour.Behaviour):
    def __init__(self,config):

        self.config=config
        
        self.head_ac=SimpleActionClient('/head_controller/follow_joint_trajectory', FollowJointTrajectoryAction) #JointTrajectory
        self.head_ac.wait_for_server()

        rospy.loginfo("connected to /head_controller")
        rospy.loginfo("Connected!")

        self.send_goal=False
        
        super(lower_head, self).__init__("Head_down") #Init the class 

    def update(self):

        if self.config=="config1":
            mov_head=self.head_mov(0.0,-0.75) # First position of the torso § TODO
            
        elif self.config=="config2":         
            mov_head=self.head_mov(0.0,0.0) # Second position of the torso TODO

        if self.send_goal:
            return pt.common.Status.FAILURE  #Behvaior status  for no success

        else:

            return pt.common.Status.SUCCESS  #Behvaior status  for  success

    def head_mov(self,x1,x2):
        
        #create the movement for the torso
        head=JointTrajectory() #See trajectory_msg.msg
        head.joint_names=['head_1_joint','head_2_joint'] #Define the joint 
        head_p=JointTrajectoryPoint() #See trajectory_msg.msg
        head_p.positions =[x1,x2]  #Define the point
        head_p.time_from_start = rospy.Duration(15)
        head_goal_pos=FollowJointTrajectoryGoal() #See control_msg.msg
        head.points.append(head_p) #Add the point of the joint 
        head_goal_pos.trajectory=head
        head_goal_pos.goal_time_tolerance=rospy.Duration(0)
        self.head_ac.send_goal(head_goal_pos) #Send the position to reach by each joint
        rospy.loginfo("goal send success")
        self.head_ac.wait_for_result() #wait the result 


class pick_place(pt.behaviour.Behaviour):

    def __init__(self):

        rospy.loginfo(" Init pick and place ")
        self.sg = SphericalGrasps() #Call the class for grasping object
        rospy.loginfo("Connecting to pickup AS")
        self.pickup_ac = SimpleActionClient('/pickup', PickupAction) #Connect to server with  the client 

        self.pickup_ac.wait_for_server() #Wait the server response
        rospy.loginfo("Succefully connected.")
        rospy.loginfo("Connecting to place AS")
        self.place_ac = SimpleActionClient('/place', PlaceAction) #Connect to server with  the client 
        self.place_ac.wait_for_server() #Wait the server response 
        rospy.loginfo("Succesfully connected.")
        self.scene = PlanningSceneInterface() #Call the class for planning the scene ( see moveit_msg)
        rospy.loginfo("Connecting to /get_planning_scene service")
        self.scene_srv = rospy.ServiceProxy('/get_planning_scene', GetPlanningScene) #Call the service 

        self.scene_srv.wait_for_service()  #Wait the server response 
        rospy.loginfo("Connected.")

        self.head_cmd = rospy.Publisher('/head_controller/command', JointTrajectory, queue_size=1)


		# Get the links of the end effector exclude from collisions

        self.links_to_allow_contact =['gripper_left_finger_link', 'gripper_right_finger_link', 'gripper_link'] #Define the gripper link

        if self.links_to_allow_contact is None:

            rospy.logwarn("Didn't find any links to allow contacts... at param ~links_to_allow_contact")
        else:
            rospy.loginfo("Found links to allow contacts: " + str(self.links_to_allow_contact))

        self.pick_as = SimpleActionServer('/pickup_pose', PickUpPoseAction,execute_cb=self.pick_cb, auto_start=False) #Connect to server with  the client 
        self.pick_as.start() #Active the service 

        self.place_as = SimpleActionServer('/place_pose', PickUpPoseAction, execute_cb=self.place_cb, auto_start=False) #Connect to server with  the client 
        self.place_as.start() #Active the service 

        rospy.loginfo("Connecting to clear octomap service...")
        self.clear_octomap_srv = rospy.ServiceProxy('/clear_octomap', Empty) #Call the service 
        self.clear_octomap_srv.wait_for_service()  #Wait the server response 
        rospy.loginfo("Connected!")

        #Here we will use transform a from the camera to the base_footprint for the end effector 
        self.bridge=CvBridge() #Convert between ros image messages to Opencv images 
        self.tfBuffer=tf2_ros.Buffer() #Create a buffer
        self.tf_l=tf2_ros.TransformListener(self.tfBuffer) #create a listener 
        ######################################
        self.pick_cl=SimpleActionClient('/pickup_pose',PickUpPoseAction) #Connect to server with  the client
        self.pick_cl.wait_for_server() #Wait the server response 
        rospy.loginfo("connect to /pickup_pose server")

        self.place_cl=SimpleActionClient('/place_pose',PickUpPoseAction) #Connect to server with  the client
        self.place_cl.wait_for_server() #Wait the server response 
        rospy.loginfo("connect to /place_pose server")

        self.detected_pose_pub=rospy.Publisher('/detected_aruco_pose',PoseStamped,queue_size=1,latch=True) #Publish the detected pose 
        self.pick_place_goal=False

        #Verify the error from the moveit when we use a moveit class 
        self.moveit_error_dict = {}
        for name in MoveItErrorCodes.__dict__.keys():
            if not name[:1] == '_':
                code = MoveItErrorCodes.__dict__[name]
                self.moveit_error_dict[code] = name


        super(pick_place, self).__init__("pick_object")   #Init the class 

    def update(self):

        Pick=self.pick_aruco("pick") #pick the object 
       # Place=self.place_aruco()    #place the object

        if self.pick_place_goal:
            return pt.common.Status.FAILURE #Behvaior status  for no success

        else:

            return pt.common.Status.SUCCESS #Behvaior status  for  success


    def strip_leading_slash(self,s):

        return s[1:] if s.startswith("/") else s

    def pick_aruco(self,operator):
        self.lower_head()
        aruco_pose=rospy.wait_for_message('/aruco_single/pose',PoseStamped) #Wait for message from the topic 
        aruco_pose.header.frame_id=self.strip_leading_slash(aruco_pose.header.frame_id)  #take the pose 
        rospy.loginfo("Go to :"+str(aruco_pose)) 
        rospy.loginfo("spherical_grasp_gui: Transforming frame:" + aruco_pose.header.frame_id + " to 'base_footprint' ")
        
        ps=PoseStamped() #See geometry_msgs.msg
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
           
            pick_g=PickUpPoseGoal()    #(See navigation.msg )  Create a pickUp goal for sending 

        if operator=="pick":

            rospy.loginfo("Setting object pose based on Aruco detection")
            pick_g.object_pose.pose.position= aruco_ps.pose.position #Pick position

            pick_g.object_pose.pose.position.z += 0.17
        #    pick_g.object_pose.pose.position.x -= 0.01
        #    pick_g.object_pose.pose.position.y += 0.02

            #pick_g.object_pose.pose.position.z += 0.1 #*(1.6/2.0)
            #pick_g.object_pose.pose.position.x += 0.01
            #pick_g.object_pose.pose.position.y += 0.01

            rospy.loginfo("aruco pose in base footprint:" + str(pick_g)) #Show the aruco position 

            pick_g.object_pose.header.frame_id='base_footprint'
            pick_g.object_pose.pose.orientation.w= 1.0
            self.detected_pose_pub.publish(pick_g.object_pose) #Publish the aruco position
            rospy.loginfo(" Go to pick :" + str(pick_g))
            self.pick_cl.send_goal_and_wait(pick_g) #Send the position as goal 
            rospy.loginfo("Done !")
            result=self.pick_cl.get_result() #Get the result to see if the goal is sending 
            #Send a message error  if the object is not reach 
            if str(self.moveit_error_dict[result.error_code]) != "SUCCESS":

                rospy.logerr("Failled to pick , not trying further")

                return


    # def place_aruco(self): 
    #     #Essaye dimplémenter cette foncton comme une classe pour placer lobject quand on veut 
    #     #ou garder la meme en instanciant un operateur pour place with a elif 
          # rospy.sleep(5)
          # pick_g.object_pose.pose.position.z+=0.05    
          # self.place_cl.send_goal_and_wait(pick_g) #send the pickUp goal  
          # rospy.loginfo("Object placed ")
    def lower_head(self):
        rospy.loginfo("Moving head down")
        jt = JointTrajectory()
        jt.joint_names = ['head_1_joint', 'head_2_joint']
        jtp = JointTrajectoryPoint()
        jtp.positions = [0.0, -0.75]
        jtp.time_from_start = rospy.Duration(2.0)
        jt.points.append(jtp)
        self.head_cmd.publish(jt)
        rospy.loginfo("Done.")
    def createPickupGoal(self,group="arm_torso", target="part", grasp_pose=PoseStamped(), possible_grasps=[], links_to_allow_contact=None):
        #For picking the object we should plan this by using moveit 
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

    def createPlaceGoal(self,place_pose, place_locations, group="arm_torso", target="part", links_to_allow_contact=None):

        #For placing the object we should plan this by using moveit 
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
        
        #type goal: PickUpPoseGoal
        #This callback allow us to know if the picking is done or not 
        error_code = self.grasp_object(goal.object_pose)
        p_res = PickUpPoseResult()
        p_res.error_code = error_code
        if error_code != 1:
            self.pick_as.set_aborted(p_res)
        else:
            self.pick_as.set_succeeded(p_res)

    def place_cb(self, goal):
        
        #type goal: PickUpPoseGoal
        #This callback allow us to know if the placing is done or not 

        error_code = self.place_object(goal.object_pose)
        p_res = PickUpPoseResult()
        p_res.error_code = error_code

        if error_code != 1:
            self.place_as.set_aborted(p_res)
        else:
            self.place_as.set_succeeded(p_res)

    def wait_for_planning_scene_object(self, object_name='part'):

        rospy.loginfo("Waiting for object '" + object_name + "' to appear in planning scene...")
        gps_req = GetPlanningSceneRequest()
        gps_req.components.components = gps_req.components.WORLD_OBJECT_NAMES

        part_in_scene = False
        if not part_in_scene:
            # This call takes a while when rgbd sensor is set
            gps_resp = self.scene_srv.call(gps_req)
            # Check if 'part' is in the answer
            for collision_obj in gps_resp.scene.world.collision_objects:
                if collision_obj.id == object_name:
                    part_in_scene = True
                    break
            else:
                rospy.sleep(1.0)

        rospy.loginfo("'" + object_name + "' is in scene!")

    def grasp_object(self, object_pose):
        #In this function we take into acount that the object we will be picking in a real world not gazebo 
        #We have arrang the code for this task 
        rospy.loginfo("Removing any previous 'part' object")
        self.scene.remove_attached_object("arm_tool_link")
        self.scene.remove_world_object("part")
        self.scene.remove_world_object("table")

        rospy.loginfo("Clearing octomap")
        self.clear_octomap_srv.call(EmptyRequest())

        rospy.sleep(2.0)  # Removing is fast
        rospy.loginfo("Adding new 'part' object")
        rospy.loginfo("Object pose: %s", object_pose.pose)
        
       # Add object description in scene
        self.object_height = 0.12
        self.object_width = 0.1
        self.object_depth = 0.07
        self.scene.add_box("part", object_pose, (self.object_depth, self.object_width, self.object_height))

        rospy.loginfo("Second%s", object_pose.pose)
        table_pose = deepcopy(object_pose)

        #define a virtual table below the object
        table_height = 0.8
        table_width  = 1.6
        table_depth  = 0.8
        table_pose.pose.position.z += -(2*self.object_width)/2 -table_height/2
        print('A')
        table_height -= 0.02 #remove few milimeters to prevent contact between the object and the table
        print('B')

        self.scene.add_box("table", table_pose, (table_depth, table_width, table_height))
        print('C')

    #     # # We need to wait for the object part to appear
        self.wait_for_planning_scene_object()
        #self.wait_for_planning_scene_object("table")
        print('D')

        # compute grasps
        possible_grasps = self.sg.create_grasps_from_object_pose(object_pose) #Define the object to grasp
        self.pickup_ac
        goal =self.createPickupGoal("arm_torso", "part", object_pose, possible_grasps, self.links_to_allow_contact) #Create the goal to send 
        rospy.loginfo("Sending goal")
        self.pickup_ac.send_goal(goal) #Send goal 
        rospy.loginfo("Waiting for result")
        self.pickup_ac.wait_for_result() #Wait the result 
        result = self.pickup_ac.get_result() #Get the result 
        rospy.logdebug("Using torso result: " + str(result)) #Show the result 
        rospy.loginfo("Pick result: " + str(self.moveit_error_dict[result.error_code.val])) #Show if we have a error 
        
        return result.error_code.val

    def place_object(self, object_pose):

        rospy.loginfo("Clearing octomap")
        self.clear_octomap_srv.call(EmptyRequest())
        possible_placings = self.sg.create_placings_from_object_pose(object_pose) #Define the object to place
        # Try only with arm
        rospy.loginfo("Trying to place using only arm")
        goal = self.createPlaceGoal(object_pose, possible_placings, "arm", "part", self.links_to_allow_contact) #Create the goal to send for placing 
        rospy.loginfo("Sending goal")
        self.place_ac.send_goal(goal) #send goal 
        rospy.loginfo("Waiting for result")
        self.place_ac.wait_for_result() #send result 
        result = self.place_ac.get_result()
        rospy.loginfo(str(self.moveit_error_dict[result.error_code.val])) #Show if we have a error 

        if str(self.moveit_error_dict[result.error_code.val]) != "SUCCESS":
            rospy.loginfo("Trying to place with arm and torso")
            # Try with arm and torso , it is similary with the previous , here we just add the torso (if the object if on top for example )
            goal = self.createPlaceGoal(object_pose, possible_placings, "arm_torso", "part", self.links_to_allow_contact)
            rospy.loginfo("Sending goal")
            self.place_ac.send_goal(goal)
            rospy.loginfo("Waiting for result")
            self.place_ac.wait_for_result()
            result = self.place_ac.get_result()
            rospy.logerr(str(self.moveit_error_dict[result.error_code.val]))

        # print result
        rospy.loginfo("Result: " +str(self.moveit_error_dict[result.error_code.val]))
        rospy.loginfo("Removing previous 'part' object")
        self.scene.remove_world_object("part")

        return result.error_code.val


class BehaviourTree(ptr.trees.BehaviourTree):

    #This is the principal class which the other class for defining each action in the behaviorTree  
    def __init__(self):

        rospy.loginfo("Initialising behaviour tree")

        Nav1=movebase("point1")
        Nav2=movebase("point2")
        Detect=aruco_detect()
        Arm_tucking1=arm_tucking("config1")
        Arm_tucking2=arm_tucking("config2")
        Torso_tucking1=torso_tucking("config1")
        Torso_tucking2=torso_tucking("config2")
        Head_down=lower_head("config1")
        Pick_object=pick_place()
       
        root=pt.composites.Sequence(name="Task") #The type of behaviorTree, here the type is a sequence 
    
    #   root.add_children([Nav1,Nav2]) #Add  the actions of the sequence
    #   root.add_children([ Arm_tucking1, Arm_tucking2])
    #   root.add_children([Nav1,Torso_tucking1,Arm_tucking2,Nav2])

        root.add_children([Nav1, Torso_tucking1, Arm_tucking1, Head_down, Detect, Pick_object, Arm_tucking2]) ##Revoir l'aruco detecte ??   #Add  the actions of the sequence
  
        super(BehaviourTree, self).__init__(root) #Init the class 

        rospy.sleep(5)

        self.setup(timeout=15)

        while not rospy.is_shutdown(): self.tick_tock(500)
        
        rospy.is_shutdown()

if __name__ == '__main__':

        rospy.init_node('behavior_tree')
        
        try:

            BehaviourTree()

        except rospy.ROSInterruptException:

            pass

       # rospy.spin()         
          

#! /usr/bin/env python
import functools
import py_trees as pt 
import py_trees_ros as ptr
import py_trees.console as console
import rospy
import sys
import geometry_msgs.msg as geometry_msgs
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal, MoveBaseActionFeedback, MoveBaseActionGoal 
import mbf_msgs.msg as mbf_msgs
import numpy as np 
import time 
import actionlib
import mbf_msgs.msg as mbf_msgs
import move_base_msgs.msg as mb_msgs
from actionlib_msgs.msg import GoalStatus
from actionlib import SimpleActionClient
from geometry_msgs.msg import PoseStamped
from aruco_msgs.msg import Marker
from aruco_msgs.msg import MarkerArray
from play_motion_msgs.msg import PlayMotionAction, PlayMotionGoal
from moveit_msgs.msg import MoveGroupGoal, MoveGroupResult, MoveGroupAction, Constraints, MoveItErrorCodes, JointConstraint, MoveGroupActionGoal, MotionPlanRequest
from std_msgs.msg import Header
import moveit_commander
import moveit_msgs.msg  
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal 
from trajectory_msgs.msg import JointTrajectoryPoint, JointTrajectory 

#from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryFeeback, FollowJointTrajectoryResult
#from trajectory_msgs.msg import JointTrajectoryPoint
#from reactive_sequence import RSequence

class movebase(pt.behaviour.Behaviour):

    def __init__(self,pose):
        
        rospy.loginfo('Initialisiation move base ')
        rospy.loginfo("waiting for /move_base actin server")
        self.client=SimpleActionClient('move_base', MoveBaseAction)

        if not self.client.wait_for_server():

            rospy.loginfo("Connexion to move_base server  failed ")
            exit()

        rospy.loginfo("Connected to /move_base server success")

        super(movebase,self).__init__("Move base ")  
        self.pose=pose 
        self.at_position=False
        self.bb=pt.blackboard.Blackboard() 

    def update(self):

      if self.pose=="point1":

        goals=self.create_goal(2.33, 0.588, 1.0)
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

    def create_goal(self,x,y,ww):

        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = x
        goal.target_pose.pose.position.y = y
        goal.target_pose.pose.position.z = 0.0
        goal.target_pose.pose.orientation.x = 0.0
        goal.target_pose.pose.orientation.y = 0.0
        goal.target_pose.pose.orientation.z = 0.0
        goal.target_pose.pose.orientation.w = ww
        
        return goal 

class aruco_detect(pt.behaviour.Behaviour):

    def __init__(self):

        rospy.sleep(2.0)
        rospy.loginfo("Waiting for Aruco detection  ")

        self.last_call=time.time()

        self.aruco_pose=rospy.Subscriber('/aruco_single/pose',PoseStamped,self.aruco_cb) #Utiliser unwait_for_server

        super(aruco_detect,self).__init__("Aruco_detection")
        self.aruco_verif=False 

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
#       rospy.loginfo("Aruco"+str(msg.pose.position))
#         for marker in msg.markers:
#             if marker.id==self.aruco_id or marker.id==111:
#                 self.aruco_found=True
#                 self.aruco_pose=marker.pose
#                 self.aruco_pose.pose.orientation.x=0.1   
#                 self.aruco_pose.pose.orientation.y=0.1   
#                 self.aruco_pose.pose.orientation.z=0.1   
#                 self.aruco_pose.pose.orientation.w=0.1 
#                 self.aruco_pub.publish(self.aruco_pose.pose)  

class arm_arng(pt.behaviour.Behaviour):

    def __init__(self,config):

        
        rospy.loginfo("Arm tucking")
        self.arm_cmd = rospy.Publisher('/arm_controller/command', JointTrajectory, queue_size=1)
        self.torso_cmd = rospy.Publisher('/torso_controller/command', JointTrajectory, queue_size=1)

        # self.config=config

        # moveit_commander.roscpp_initialize(sys.argv)
        # self.robot=moveit_commander.RobotCommander()
        # self.scene=moveit_commander.PlanningSceneInterface()
        # self.group1=moveit_commander.MoveGroupCommander("arm_torso")         
        # self.display_trajectory_publisher=rospy.Publisher('/move_group/display_planned_path',moveit_msgs.msg.DisplayTrajectory,queue_size=1) 
        
        # self.moveit_ac=SimpleActionClient('/move_group', MoveGroupAction)
        # self.moveit_ac.wait_for_server()

        rospy.loginfo("connected to /arm_controller")

        # if not self.motion_ac.wait_for_server(rospy.Duration(5.0)):
        #     rospy.logerr("Could not connect to /tts action server!")
        #     exit(0)
        rospy.loginfo("Connected!")

        self.sent_goal=False
        
        super(arm_arng, self).__init__("Tucking_Arm")

    def update(self):
   ##################################################     
       
        rospy.sleep(1)

####################################################

        # rospy.sleep(1.0)

        # joint_goal=self.moveit_create_goal(0.25, 0.20, -1.34, -0.2, 1.94 ,-1.57, 1.37, 0.0)

        # elif self.config=="config2":
        # joint_goal=self.group1.get_current_joint_values()

        # joint_posi=[0.30, 0.20, -1.34, -0.2, 1.94 ,-1.57, 1.37, 0.0]
        # joint_name=["torso_lift_joint", "arm_1_joint", "arm_2_joint", "arm_3_joint", "arm_4_joint", "arm_5_joint", "arm_6_joint", "arm_7_joint"]

        #  self.group1.go(joint_goal, wait=True)

        # print("A")

        # joint_goal=self.moveit_create_goal(joint_name, joint_posi, group="arm_torso", plan_only=True)
        # self.moveit_ac.send_goal(joint_goal)

############################################        
    #     g=PlayMotionGoal()
    #     g.motion_name='pregrasp'
    #     g.skip_planning=False
    #    # motion=self.play_motion_goal()
    #     self.motion_ac.send_goal_and_wait(g)
##################################################

        jt=JointTrajectory()
        jt.joint_names=['arm_1_joint', 'arm_2_joint', 'arm_3_joint', 'arm_4_joint', 'arm_5_joint', 'arm_6_joint', 'arm_7_joint']
        jtp=JointTrajectoryPoint()
        jtp.positions =[0.2, -1.2, -0.2, 1.94 ,-1.57, 1.37, 0.0]
        jtp.time_from_start = rospy.Duration(3.0)
        jt.points.append(jtp)
        self.arm_cmd.publish(jt)

        rospy.sleep(5)

        tor=JointTrajectory()
        tor.joint_names=['torso_lift_joint']
        tor_p=JointTrajectoryPoint()
        tor_p.positions =[0.25]
        tor_p.time_from_start = rospy.Duration(2.5)
        tor.points.append(tor_p)
        self.torso_cmd.publish(tor)

        if self.sent_goal:

            return pt.common.Status.FAILURE

        else:

            return pt.common.Status.SUCCESS

   # def moveit_create_goal(self,torso,arm1,arm2,arm3,arm4,arm5,arm6,arm7):
   # def moveit_create_goal(self,joint_names, joint_values, group="arm_torso", plan_only=True):
   # def play_motion_goal(self):

  #################################################################################

        # joint_goal=self.group1.get_current_joint_values()
        # joint_goal=[torso, arm1, arm2, arm3, arm4,arm5, arm6, arm7]
        # #joint_goal=[0.15, 0.20, -1.34, -0.2, 1.94 ,-1.57, 1.37, 0.0]
        # self.group1.set_joint_value_target(joint_goal)
        # plan1=self.group1.plan()
        # self.group1.set_planning_time(5.0)
        # return self.group1.go(wait=True)
###################################################################################

        #self.group1.stop() 
        # header=Header()
        # header.frame_id='base_footprint'
        # header.stamp=rospy.Time.now()
        # moveit_goal=MoveGroupGoal()
        # goal_c=Constraints()
        # goal_c.header.header.frame_id='base_footprint'
        # for name, value in zip(joint_names, joint_values):
        #     joint_c= JointConstraint()
        #     joint_c.joint_name= name
        #     joint_c.position= value
        #     joint_c.tolerance_above=0.01
        #     joint_c.tolerance_below=0.01
        #     joint_c.weight=1.0        
        #     goal_c.joint_constraints.append(joint_c)   
        # moveit_goal.request.goal_constraints.append(goal_c)
        # moveit_goal.request.max_velocity_scaling_factor=0.25
        # moveit_goal.request.planner_id="arm_torso"
        # moveit_goal.request.num_planning_attempts=1
        # moveit_goal.request.allowed_planning_time=15.0
        # moveit_goal.planning_options.plan_only=plan_only
        # moveit_goal.planning_options.planning_scene_diff.is_diff= True 
        # moveit_goal.request.group_name= group        
        # return  self.moveit_ac.send_goal(moveit_goal) #self.moveit_ac.send_goal(moveit_goal.goal)
        # #return self.moveit_goal.goal
        #g=PlayMotionGoal()
        #g.motion_name='pregrasp'
        #return g
#######################################################################################


        #Essayer de faire une seul ou deux fonctions pour torso & arm

# Faire pick + octomap (voir lien )

class BehaviourTree(ptr.trees.BehaviourTree):

    def __init__(self):

        rospy.loginfo("Initialising behaviour tree")

        nav1=movebase("point1")
        nav2=movebase("point2")
        detect=aruco_detect()
        arm_tucking1=arm_arng("config1")

        #arm_tucking2=arm_arng("config2")
        root=pt.composites.Sequence(name="Task")
        root.add_children([arm_tucking1])

        #root.add_children([arm_tucking1])

        #print(pt.display.ascii_tree(root))

        super(BehaviourTree, self).__init__(root)
        rospy.sleep(5)
        self.setup(timeout=15)

        while not rospy.is_shutdown(): self.tick_tock(500)

if __name__ == '__main__':

        rospy.init_node('behavior_tree')
        
        try:

            BehaviourTree()

        except rospy.ROSInterruptException:
             pass

       # rospy.spin()         
          

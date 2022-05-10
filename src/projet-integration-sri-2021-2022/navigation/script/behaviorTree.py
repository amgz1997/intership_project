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
#from moveit_msgs.msg import MoveGroupGoal, MoveGroupResult, MoveGroupAction, Constraints,MoveItErrorCodes, JointConstraint
from std_msgs.msg import Header
import moveit_commander
import moveit_msgs.msg  

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

        goals=self.create_goal(-0.9, 10.075, 1.0)
        self.client.send_goal(goals)

      elif self.pose=="point2":

        goals=self.create_goal(2.642, 9.96, 1.0)
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

        self.config=config
        moveit_commander.roscpp_initialize(sys.argv)
        #rospy.init_node('move_group_python_interface_tutorial',anonymous=True)

        self.sent_goal=False

        
        super(arm_arng, self).__init__("Tucking_Arm")

    def update(self):

    #   elif self.config=="config2":
    #     joint_goal=self.group1.get_current_joint_values()
    #     joint_goal=[0.34, 0.05, -0.07, -1.0, 1.5 ,-1.57, 1.52, 0.0]
    #     self.group1.go(joint_goal, wait=True)
      joint_goal=self.moveit_create_goal(0.15, 0.20, -1.34, -0.2, 1.94 ,-1.57, 1.37, 0.0)

      if self.sent_goal:
          return pt.common.Status.SUCCESS

      else :
          return pt.common.Status.FAILURE

    def moveit_create_goal(self,torso,arm1,arm2,arm3,arm4,arm5,arm6,arm7):

        self.robot=moveit_commander.RobotCommander()
        self.scene=moveit_commander.PlanningSceneInterface()
        self.group1=moveit_commander.MoveGroupCommander("arm_torso")
        self.display_trajectory_publisher=rospy.Publisher('/move_group/display_planned_path',moveit_msgs.msg.DisplayTrajectory)  
       # self.display_trajectory_publisher=rospy.Publisher('/move_group/goal',MoveBaseActionGoal)  

        joint_goal=self.group1.get_current_joint_values()
      #print("%s" % joint_goal)
      
      #if self.config=="config1":

        joint_goal=[torso, arm1, arm2, arm3, arm4,arm5, arm6, arm7]

        #Essayer 
        #joint_goal=self.group1.set_current_joint_values(joint_goal)
        #self.plan1=group1.plan()

        self.group1.go(joint_goal, wait=True) 
       
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
        root.add_children([nav1,arm_tucking1,detect,nav2])

        #root.add_children([arm_tucking1])
        #print(pt.display.ascii_tree(root))

        super(BehaviourTree, self).__init__(root)
        rospy.sleep(5)
        self.setup(timeout=15)

        while not rospy.is_shutdown(): self.tick_tock(10000)

if __name__ == '__main__':

        rospy.init_node('behavior_tree')
        
        try:

            BehaviourTree()

        except rospy.ROSInterruptException:
             pass

        rospy.spin()          
          

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

            mov_joint=self.joint_mov(0.21, -1.37, -0.20, 1.94, -1.57, 1.37, 0.0) #initial

           # rospy.sleep(5)
            
            #rospy.sleep(25)

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

            
            mov_torso=self.torso_mov(0.15)
            
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

# Faire pick + octomap (voir lien )
#class pick(ptr.trees.BehaviourTree):
#See if i should implement a one class or two for the pick and place goal 

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

        root=pt.composites.Sequence(name="Task")

        root.add_children([Nav1,Detect,Arm_tucking1,Torso_tucking1,Nav2]) ##Revoir l'aruco detecte ??
        
        #root.add_children([Nav1,Nav2])

        #root.add_children([Torso_tucking1])
        
        #print(pt.display.ascii_tree(root))

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
          

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

    #def initialise(self):
       # x,y,ww=self.pose

    def update(self):

      #goals=self.create_goal(0.0, 0.0, 1.0)
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

"""class aruco_detect(pt.behaviour.Behaviour):
    def __init__(self):
    def update(self): """   
        
class BehaviourTree(ptr.trees.BehaviourTree):

    def __init__(self):

        rospy.loginfo("Initialising behaviour tree")
        nav1=movebase("point1")
        nav2=movebase("point2")

        root=pt.composites.Sequence(name="Task")
        root.add_children([nav1,nav2])
        print(pt.display.ascii_tree(root))


        super(BehaviourTree, self).__init__(root)
        rospy.sleep(5)
        self.setup(timeout=150)
        while not rospy.is_shutdown(): self.tick_tock(5000)

    # def shutdown(behaviour_tree):
    #     behaviour_tree.interrupt()

if __name__ == '__main__':

        rospy.init_node('behavior_tree')
        
        try:

            BehaviourTree()
        except rospy.ROSInterruptException:
            pass

        rospy.spin()          
          


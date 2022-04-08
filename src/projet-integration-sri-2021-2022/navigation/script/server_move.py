#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
import sys
import time
import os
import numpy as np
import actionlib
import actionlib_tutorials.msg
import navigation.msg
import std_msgs

#from tf.transformations import quaternion_from_euler

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Pose, Point, Quaternion, PoseStamped
from navigation.srv import *



pub = rospy.Publisher('/move_base_simple/goal', PoseStamped, queue_size=10) #Liaison avec topic 

def handle_move(req):

    rospy.loginfo(req)
    pose = PoseStamped()
    pose.header = std_msgs.msg.Header()
    pose.header.stamp = rospy.Time.now()
    pose.header.frame_id = "map" 
    pose.pose = Pose()

    pose.pose.position.x = req.x 
    pose.pose.position.y = req.y 
    pose.pose.position.z = 0.0 
    
    pose.pose.orientation.x = 0.0  
    pose.pose.orientation.y = 0.0 
    pose.pose.orientation.z = req.theta  # Orientation theta 
    pose.pose.orientation.w = 1.0

   # pose.pose.orientation.x = 0.0  #req.x*np.pi/180
   # pose.pose.orientation.y = 0.0 #req.y*np.pi/180
   # pose.pose.orientation.z = 0.0
   # pose.pose.orientation.w = 1.0
   # q=tf.Quaternions(0,0,theta) 

    
    pub.publish(pose) #Envoie de la pose (x,y,theta)
    return 0


def add_move_server():
    
    rospy.init_node('move_base_server') #initialisation du node 
    s = rospy.Service('/sri22/move_base',move_base,handle_move) #Appel du service /sri/move_base
    if s :  #verification de la connexion

        print("Ready to go !!!!")

    else:

        print("Calling server failed !!!!")   

    rospy.spin()


if __name__=="__main__":

    add_move_server()

#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
import sys
import time
import os

import actionlib
import actionlib_tutorials.msg
import navigation.msg
import std_msgs

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
    pose.pose.orientation.z = 0.0
    pose.pose.orientation.w = 1.0
    
    pub.publish(pose) #Envoie de la pose (x,y,z)
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

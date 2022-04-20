#!/usr/bin/env python


<<<<<<< HEAD
import actionlib
import actionlib_tutorials.msg
import std_msgs

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Pose, Point, Quaternion, PoseStamped
from navigation.srv import *


pub = rospy.Publisher('/move_base_simple/goal', PoseStamped, queue_size=1)

def handle_move(req):
    rospy.loginfo(req)
    pose = PoseStamped()
    pose.header = std_msgs.msg.Header()
    pose.header.stamp = rospy.Time.now()
    pose.header.frame_id = "map" 
    pose.pose = Pose()

    pose.pose.position.x = req.x #  kinect Z value, [2], is X in TF of camera_link
    pose.pose.position.y = req.y # kinect X value, [0], is -Y in TF of camera_link
    pose.pose.position.z = 0.0 # kinect Y value, [1], is -Z in TF of camera_link
    pose.pose.orientation.x = 0.0
    pose.pose.orientation.y = 0.0
    pose.pose.orientation.z = 0.0
    pose.pose.orientation.w = 1.0
    
    pub.publish(pose) #Envoie des coordonnées x,y,theta
    return 0
=======
# import actionlib
# import rospy
# import mbf_msgs.msg as mbf_msgs
# import move_base_msgs.msg as mb_msgs

# def mb_execute_cb(msg):
#     mbf_mb_ac.send_goal(mbf_msgs.MoveBaseGoal(target_pose=msg.target_pose),
#                         feedback_cb=mbf_feedback_cb)

#     rospy.logdebug("Relaying move_base goal to mbf")
#     mbf_mb_ac.wait_for_result()

#     status = mbf_mb_ac.get_state()
#     result = mbf_mb_ac.get_result()

#     rospy.logdebug("MBF execution completed with result [%d]: %s", result.outcome, result.message)
#     if result.outcome == mbf_msgs.MoveBaseResult.SUCCESS:
#         mb_as.set_succeeded(mb_msgs.MoveBaseResult(), "Goal reached.")
#     else:
#         mb_as.set_aborted(mb_msgs.MoveBaseResult(), result.message)

# def mbf_feedback_cb(feedback):
#     mb_as.publish_feedback(mb_msgs.MoveBaseFeedback(base_position=feedback.current_pose))
>>>>>>> 67f25fd3cd52e69b0cd8b77ac77172ac008e3ed0

# if __name__ == '__main__':
#     rospy.init_node("move_base1")

#     # move_base_flex get_path and move_base action clients
#     mbf_mb_ac = actionlib.SimpleActionClient("move_base_flex/move_base", mbf_msgs.MoveBaseAction)
#     mbf_mb_ac.wait_for_server(rospy.Duration(10))

#     mb_as = actionlib.SimpleActionServer('move_base', mb_msgs.MoveBaseAction, mb_execute_cb, auto_start=False)
#     mb_as.start()
#     rospy.spin()

import rospy 
import actionlib
import actionlib_tutorials.msg 
class FibonacciAction(object):
    # create messages that are used to publish feedback/result
    _feedback = actionlib_tutorials.msg.FibonacciFeedback()
    _result = actionlib_tutorials.msg.FibonacciResult()

    def __init__(self, name):
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, actionlib_tutorials.msg.FibonacciAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()
    
<<<<<<< HEAD
    rospy.init_node('move_base_server') #intilisation du node 
    s = rospy.Service('/sri22/move_base',move_base,handle_move) #Appel du service /sri/move_base 
  
    if s : #verification de la connexion 
        print("Ready to go")
    else :
        print("Calling service  failed ")    

    rospy.spin()


if __name__=="__main__":
    add_move_server()
=======
    def execute_cb(self, goal):
        # helper variables
        r = rospy.Rate(1)
        success = True
        
        # append the seeds for the fibonacci sequence
        self._feedback.sequence = []
        self._feedback.sequence.append(0)
        self._feedback.sequence.append(1)
        
        # publish info to the console for the user
        rospy.loginfo('%s: Executing, creating fibonacci sequence of order %i with seeds %i, %i' % (self._action_name, goal.order, self._feedback.sequence[0], self._feedback.sequence[1]))
        
        # start executing the action
        for i in range(1, goal.order):
            # check that preempt has not been requested by the client
            if self._as.is_preempt_requested():
                rospy.loginfo('%s: Preempted' % self._action_name)
                self._as.set_preempted()
                success = False
                break
            self._feedback.sequence.append(self._feedback.sequence[i] + self._feedback.sequence[i-1])
            # publish the feedback
            self._as.publish_feedback(self._feedback)
            # this step is not necessary, the sequence is computed at 1 Hz for demonstration purposes
            r.sleep()

        if success:
            self._result.sequence = self._feedback.sequence
            rospy.loginfo('%s: Succeeded' % self._action_name)
            self._as.set_succeeded(self._result)
        
if __name__ == '__main__':
    rospy.init_node('fibonacci')
    server = FibonacciAction(rospy.get_name())
    rospy.spin()



>>>>>>> 67f25fd3cd52e69b0cd8b77ac77172ac008e3ed0

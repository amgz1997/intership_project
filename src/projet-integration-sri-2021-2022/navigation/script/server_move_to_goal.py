#!/usr/bin/env python

# import actionlib
# import rospy
# import mbf_msgs.msg as mbf_msgs
# import move_base_msgs.msg as mb_msgs
# from geometry_msgs.msg import PoseStamped, PoseArray, PolygonStamped

# def mb_execute_cb(msg):

#     #mbf_mb_ac.send_goal(mbf_msgs.MoveBaseGoal(target_pose=msg.target_pose),feedback_cb=mbf_feedback_cb)
#    # rospy.logdebug("Relaying move_base goal to mbf")

#     #mbf_mb_ac.wait_for_result()
#     status = mbf_mb_ac.get_state()
#     result = mbf_mb_ac.get_result()  

#     rospy.logdebug("MBF execution completed with result [%d]: %s", result.outcome, result.message)

#     if result.outcome == mbf_msgs.MoveBaseResult.SUCCESS:

#         mb_as.set_succeeded(mb_msgs.MoveBaseResult(), "Goal reached.")

#     else:

#         mb_as.set_aborted(mb_msgs.MoveBaseResult(), result.message)
    
# def mbf_feedback_cb(feedback):
    
#     mb_as.publish_feedback(mb_msgs.MoveBaseFeeback(base_position=feedback.current_pose))
#     mb_as.set_succeeded()
    
# if __name__ == '__main__':

#     rospy.init_node('navigation')
#     # move_base_flex get_path and move_base action clients

#     #mbf_mb_ac = actionlib.SimpleActionClient("move_base_flex/move_base", mbf_msgs.MoveBaseAction)
#     #mbf_mb_ac.wait_for_server(rospy.Duration(10))

#     mb_as = actionlib.SimpleActionServer('move_base', mb_msgs.MoveBaseAction, mb_execute_cb, auto_start=False)
#     mb_as.start()

#     rospy.spin()

########################################################################################
import rospy
import actionlib
import actionlib_tutorials.msg
import navigation.msg
from move_base_msgs.msg  import MoveBaseAction, MoveBaseGoal ,MoveBaseFeedback ,MoveBaseResult
#import move_base_msgs.msg as mb_msgs

from geometry_msgs.msg import Pose, Point, Quaternion 

class NavigationAction(object):
   # create messages that are used to publish feedback/result
    _feedback =MoveBaseFeedback()
    _result =MoveBaseResult()

    def __init__(self, name):

        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name,MoveBaseAction, 
             execute_cb=self.execute_cb,
             auto_start = False)

        self._as.start()
       # rospy.loginfo("Action server %s started ." % rospy.get_name())
   
    def execute_cb(self, goal):

        # helper variables
        r = rospy.Rate(1)
        success = True
        # publish info to the console for the user

<<<<<<< HEAD
	    frameid = goal.target.header.frame_id	
	    point = Point(goal.target.pose.position.x, goal.target.pose.position.y, goal.target.pose.position.z)
        orientation = Quaternion(goal.target.pose.orientation.x , goal.target.pose.orientation.y, goal.target.pose.orientation.z , goal.target.pose.orientation.w)     

        
        # publish info to the console for the user
        rospy.loginfo('Executing, creating navigation ')

        if self._as.is_preempt_requested():
           rospy.loginfo('%s: Preempted' % self._action_name)
	       self._result.result_code = 1
           self._as.set_preempted(self._result)
      	   success = False
	
	result = self.movebase_client(point, orientation, frameid )
        if result:
            rospy.loginfo("Goal execution done!")
	
	self._result.result_code = 0
        self._as.set_succeeded(self._result)
=======
        self._feedback.sequence=[]
        self._feedback.sequence.append(0)
        self._feedback.sequence.append(1)
        rospy.loginfo('%s: Executing, creating Navigation sequence of order %i with seeds %i, %i' % (self._action_name, goal.order, self._feedback.sequence[0], self._feedback.sequence[1]))

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
>>>>>>> 67f25fd3cd52e69b0cd8b77ac77172ac008e3ed0

        
if __name__ == '__main__':
    rospy.init_node('navigation')
    server = NavigationAction(rospy.get_name())
    rospy.spin()





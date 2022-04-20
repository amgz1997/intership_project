#! /usr/bin/env python
import rospy
import actionlib
import mbf_msgs.msg as mbf_msgs
import move_base_msgs.msg as mb_msgs
from actionlib_msgs.msg import GoalStatus

def create_goal(x, y, z, xx, yy, zz, ww):

    goal = mb_msgs.MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    goal.target_pose.pose.position.z = z
    goal.target_pose.pose.orientation.x = xx
    goal.target_pose.pose.orientation.y = yy
    goal.target_pose.pose.orientation.z = zz
    goal.target_pose.pose.orientation.w = ww
        
    return goal

<<<<<<< HEAD
# Brings in the messages used by the fibonacci action, including the
# goal message and the result message.
import actionlib_tutorials.msg
import navigation.msg

def navigation_client():
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('navigation', navigation.msg.NavigationAction)

    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()
	
    goal = navigation.msg.NavigationGoal()

    # Creates a goal to send to the action server.
    goal.target.header.frame_id = "map"
    goal.target.pose.position.x = 0
    goal.target.pose.position.y = 0
    goal.target.pose.position.z = 0.0
    goal.target.pose.orientation.x = 0.0
    goal.target.pose.orientation.y = 0.0
    goal.target.pose.orientation.z = 0.0
    goal.target.pose.orientation.w = 1.0

    # Sends the goal to the action server.
    client.send_goal(goal)

    # Waits for the server to finish performing the action.
=======
def move(goal):

    client.send_goal(goal) #feedback_cb=cb_feeback)
>>>>>>> 67f25fd3cd52e69b0cd8b77ac77172ac008e3ed0
    client.wait_for_result()
    return client.get_state() == GoalStatus.SUCCEEDED


def nav():

    goals = [   create_goal(0.0, 0.0, 0, 0, 0, 0.0, 1),
                create_goal(0.1, 0.1, 0, 0, 0, 0.0, 1),
                
    ]

    for goal in goals:
        rospy.loginfo("Attempting to drive to %s %s", goal.target_pose.pose.position.x, goal.target_pose.pose.position.y)
        if not move(goal):
            return False

    return True

if __name__ == '__main__':

    try:

        rospy.init_node('client_navigation')
        client = actionlib.SimpleActionClient('move_base', mb_msgs.MoveBaseAction)
        client.wait_for_server()
        rospy.loginfo("Connected to SimpleActionServer 'move_base'")
        result = nav()
        rospy.loginfo("Drove to waypoints: %s", result)
        #print("Result:", ', '.join([str(n) for n in result.sequence]))

    except rospy.ROSInterruptException:
        rospy.logerror("program interrupted before completion")


# from __future__ import print_function
# import rospy

    
#  # Brings in the SimpleActionClient
# import actionlib
# # Brings in the messages used by the fibonacci action, including the
#  # goal message and the result message.
# import actionlib_tutorials.msg
 
# def fibonacci_client():
#     # Creates the SimpleActionClient, passing the type of the action
#     # (FibonacciAction) to the constructor.
#     client = actionlib.SimpleActionClient('fibonacci', actionlib_tutorials.msg.FibonacciAction)

#     # Waits until the action server has started up and started
#     # listening for goals.
#     client.wait_for_server()

#     # Creates a goal to send to the action server.
#     goal = actionlib_tutorials.msg.FibonacciGoal(order=20)

#     # Sends the goal to the action server.
#     client.send_goal(goal)

#     # Waits for the server to finish performing the action.
#     client.wait_for_result()

#     # Prints out the result of executing the action
#     return client.get_result()  # A FibonacciResult

# if __name__ == '__main__':
#     try:
#                 # Initializes a rospy node so that the SimpleActionClient can
#         # publish and subscribe over ROS.
#         rospy.init_node('fibonacci_client_py')
#         result = fibonacci_client()
#         print("Result:", ', '.join([str(n) for n in result.sequence]))
#     except rospy.ROSInterruptException:
#         print("program interrupted before completion", file=sys.stderr)
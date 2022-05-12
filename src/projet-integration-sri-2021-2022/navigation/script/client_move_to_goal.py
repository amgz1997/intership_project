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

def move(goal):

    client.send_goal(goal) #feedback_cb=cb_feeback
    client.wait_for_result()
    return client.get_state() == GoalStatus.SUCCEEDED


def nav():

    goals = [   create_goal(2.33, 0.588, 0.0, 0, 0, 0.0, 1),
                create_goal(0.0, 0.0, 0.0, 0, 0, 0.0, 1),
                
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



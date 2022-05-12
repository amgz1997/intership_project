#!/usr/bin/env python


# import argparse
# import geometry_msgs.msg as geometry_msgs
# import move_base_msgs.msg as move_base_msgs
# from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
# import py_trees_ros
# #from . import action_server
# import rclpy
# import sys

# ##############################################################################
# # Class
# ##############################################################################



# class MoveBase(py_trees.behaviour.Behaviour):
#     """
#     Simulates a move base style interface.

#     Node Name:
#         * **move_base_controller**

#     Action Servers:
#         * **/move_base** (:class:`py_trees_ros_interfaces.action.MoveBase`)

#           * point to point move base action

#     Args:
#         duration: mocked duration of a successful action
#     """
#     def __init__(self, duration=None):
#         super().__init__(
#             node_name="move_base_controller",
#             action_name="move_base",
#             action_type=move_base_msgs.MoveBase,
#             generate_feedback_message=self.generate_feedback_message,
#             duration=duration
#         )
#         self.pose = MoveBaseGoal()
#         self.goal.target_pose.header.frame_id = "map"
#         #self.pose.pose.position = geometry_msgs.Point(x=0.0, y=0.0, z=0.0)
#         self.goal.target_pose.header.stamp = rospy.Time.now()
#         self.goal.target_pose.pose.position.x = 2.3
#         self.goal.target_pose.pose.position.y = 0.588
#         self.goal.target_pose.pose.position.z = 0.0

#         #quat = tf.transformations.quaternion_from_euler(0, 0, theta)
#         self.goal.target_pose.pose.orientation.x = 0.0
#         self.goal.target_pose.pose.orientation.y = 0.0
#         self.goal.target_pose.pose.orientation.z = 0.0
#         self.goal.target_pose.pose.orientation.w = 1.0
#         return goal

#     def generate_feedback_message(self) :# -> py_trees_actions.MoveBase.Feedback:
#         """
#         Do a fake pose incremenet and populate the feedback message.

#         Returns:
#             :class:`py_trees_actions.MoveBase.Feedback`: the populated feedback message
#         """
#         # actually doesn't go to the goal right now...
#         # but we could take the feedback from the action
#         # and increment this to that proportion
#         # self.odometry.pose.pose.position.x += 0.01
#         self.pose.pose.position.x += 0.0
#         msg = py_trees_actions.MoveBase.Feedback()  # .Feedback() is more proper, but indexing can't find it
#         msg.base_position = self.pose
#         return msg




# def main():
#     """
#     Entry point for the mock move base node.
#     """
#     parser = argparse.ArgumentParser(description='Mock a docking controller')
#     command_line_args = rclpy.utilities.remove_ros_args(args=sys.argv)[1:]
#     parser.parse_args(command_line_args)

#     rclpy.init()  # picks up sys.argv automagically internally
#     move_base = MoveBase()
#     executor = rclpy.executors.MultiThreadedExecutor(num_threads=4)
#     executor.add_node(move_base.node)

#     try:
#         executor.spin()
#     except KeyboardInterrupt:
#         move_base.abort()
#         # caveat: often broken, with multiple spin_once or shutdown, error is the
#         # mysterious:
#         #   The following exception was never retrieved: PyCapsule_GetPointer
#         #   called with invalid PyCapsule object
#         executor.shutdown()  # finishes all remaining work and exits

#     move_base.shutdown()
#     rclpy.shutdown()

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Twist 
from nav_msgs.msg import Odometry
from moveit_msgs.msg import MoveGroupAction, MoveGroupActionGoal
from moveit_msgs.msg import Constraints, JointConstraint, PositionConstraint, OrientationConstraint, BoundingVolume
from naoqi_bridge_msgs.msg import JointAnglesWithSpeed

MoveGroupActionGoal_msg = MoveGroupActionGoal()
JointAnglesWithSpeed_msg = JointAnglesWithSpeed()



def dataMoveGoal(data): #MoveGroupActionGoal_msg.goal.request.goal_constraints
    try:
        #JointAnglesWithSpeed_msg.joint_names = data.goal.request.goal_constraints
        #JointAnglesWithSpeed_msg.joint_angles = data.goal.request.goal_constraints
        JointAnglesWithSpeed_msg.joint_names = ['torso_lift_joint', 'arm_1_joint', 'arm_2_joint', 'arm_3_joint', 'arm_4_joint', 'arm_5_joint', 'arm_6_joint', 'arm_7_joint']
        JointAnglesWithSpeed_msg.joint_angles = [0.15, 0.05, -0.07, -1.0, 1.5 ,-1.57, 1.52, 0.0]
        JointAnglesWithSpeed_msg.speed = 0.25
        JointAnglesWithSpeed_msg.relative = 0
    
        # sad se tu treba igrati sa stringovima. napraviti petljicu
        for i in data.goal.request.goal_constraints:
            rospy.loginfo("%s ",i)
           
        rospy.loginfo("%s ",data.goal.request.goal_constraints)
    except:
        rospy.loginfo("error happens in data MoveGoal")
        rospy.loginfo("%s ",data.goal.request.goal_constraints)
        for i in data.goal.request.goal_constraints:
            rospy.loginfo("%s ",i)
           

def move_group():
    joint_angles_pub = rospy.Publisher('/tiago_robot/pose/joint_angles', JointAnglesWithSpeed, queue_size=10)
    moveit_group_goal_sub = rospy.Subscriber('/move_group/goal', MoveGroupActionGoal, dataMoveGoal) 
    rospy.init_node('MoveGroup', anonymous=True)
    rate = rospy.Rate(10) # 10hz
  
    rospy.loginfo("move group")

    while(1):
        JointAnglesWithSpeed_msg.header.frame_id = "torso" # "base_footprint"
        JointAnglesWithSpeed_msg.header.stamp = rospy.Time.now()
    
        joint_angles_pub.publish(JointAnglesWithSpeed_msg)


        #rospy.loginfo("%s ",JointAnglesWithSpeed_msg)
        rospy.sleep(2)
    rate.sleep()

if __name__ == '__main__':
    try:
        move_group()
    except rospy.ROSInterruptException:
        pass
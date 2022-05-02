#!/usr/bin/env python


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

# if __name__ == '__main__':
#     rospy.init_node("move_base1")

#     # move_base_flex get_path and move_base action clients
#     mbf_mb_ac = actionlib.SimpleActionClient("move_base_flex/move_base", mbf_msgs.MoveBaseAction)
#     mbf_mb_ac.wait_for_server(rospy.Duration(10))

#     mb_as = actionlib.SimpleActionServer('move_base', mb_msgs.MoveBaseAction, mb_execute_cb, auto_start=False)
#     mb_as.start()
#     rospy.spin()


##########################################


import argparse
import geometry_msgs.msg as geometry_msgs
import move_base_msgs.msg as move_base_msgs
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import py_trees_ros
#from . import action_server
import rclpy
import sys

##############################################################################
# Class
##############################################################################



class MoveBase(py_trees.behaviour.Behaviour):
    """
    Simulates a move base style interface.

    Node Name:
        * **move_base_controller**

    Action Servers:
        * **/move_base** (:class:`py_trees_ros_interfaces.action.MoveBase`)

          * point to point move base action

    Args:
        duration: mocked duration of a successful action
    """
    def __init__(self, duration=None):
        super().__init__(
            node_name="move_base_controller",
            action_name="move_base",
            action_type=move_base_msgs.MoveBase,
            generate_feedback_message=self.generate_feedback_message,
            duration=duration
        )
        self.pose = MoveBaseGoal()
        self.goal.target_pose.header.frame_id = "map"
        #self.pose.pose.position = geometry_msgs.Point(x=0.0, y=0.0, z=0.0)
        self.goal.target_pose.header.stamp = rospy.Time.now()
        self.goal.target_pose.pose.position.x = 2.3
        self.goal.target_pose.pose.position.y = 0.588
        self.goal.target_pose.pose.position.z = 0.0

        #quat = tf.transformations.quaternion_from_euler(0, 0, theta)
        self.goal.target_pose.pose.orientation.x = 0.0
        self.goal.target_pose.pose.orientation.y = 0.0
        self.goal.target_pose.pose.orientation.z = 0.0
        self.goal.target_pose.pose.orientation.w = 1.0
        return goal

    def generate_feedback_message(self) :# -> py_trees_actions.MoveBase.Feedback:
        """
        Do a fake pose incremenet and populate the feedback message.

        Returns:
            :class:`py_trees_actions.MoveBase.Feedback`: the populated feedback message
        """
        # actually doesn't go to the goal right now...
        # but we could take the feedback from the action
        # and increment this to that proportion
        # self.odometry.pose.pose.position.x += 0.01
        self.pose.pose.position.x += 0.0
        msg = py_trees_actions.MoveBase.Feedback()  # .Feedback() is more proper, but indexing can't find it
        msg.base_position = self.pose
        return msg




def main():
    """
    Entry point for the mock move base node.
    """
    parser = argparse.ArgumentParser(description='Mock a docking controller')
    command_line_args = rclpy.utilities.remove_ros_args(args=sys.argv)[1:]
    parser.parse_args(command_line_args)

    rclpy.init()  # picks up sys.argv automagically internally
    move_base = MoveBase()
    executor = rclpy.executors.MultiThreadedExecutor(num_threads=4)
    executor.add_node(move_base.node)

    try:
        executor.spin()
    except KeyboardInterrupt:
        move_base.abort()
        # caveat: often broken, with multiple spin_once or shutdown, error is the
        # mysterious:
        #   The following exception was never retrieved: PyCapsule_GetPointer
        #   called with invalid PyCapsule object
        executor.shutdown()  # finishes all remaining work and exits

    move_base.shutdown()
    rclpy.shutdown()
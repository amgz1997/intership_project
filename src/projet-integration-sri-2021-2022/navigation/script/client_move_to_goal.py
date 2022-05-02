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

    goals = [   create_goal(2.1, 0.58, 0, 0, 0, 0.0, 1),
                create_goal(0.0, 0.0, 0, 0, 0, 0.0, 1),
                
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


################################ BehaviorTree ##################################
# import functools
# import py_trees
# import py_trees_ros
# import py_trees.console as console
# import rospy
# import sys
# import geometry_msgs.msg as geometry_msgs
# import mbf_msgs.msg as mbf_msgs


# ##############################################################################
# # Actions
# ##############################################################################

# class GetPath(py_trees_ros.actions.ActionClient):

#     def initialise(self):
#         """
#         Get target pose from the blackboard to create an action goal
#         """
#         self.action_goal = mbf_msgs.GetPathGoal(target_pose=py_trees.blackboard.Blackboard().get("target_pose"))
#         super(GetPath, self).initialise()

#     def update(self):
#         """
#         On success, set the resulting path on the blackboard, so ExePath can use it
#         """
#         status = super(GetPath, self).update()
#         if status == py_trees.Status.SUCCESS:
#             py_trees.blackboard.Blackboard().set("path", self.action_client.get_result().path)
#         return status

# class ExePath(py_trees_ros.actions.ActionClient):

#     def initialise(self):
#         """
#         Get path from the blackboard to create an action goal
#         """
#         self.action_goal = mbf_msgs.ExePathGoal(path=py_trees.blackboard.Blackboard().get("path"))
#         super(ExePath, self).initialise()

# class Recovery(py_trees_ros.actions.ActionClient):
#     def setup(self, timeout):
#         """
#         Read the list of available recovery behaviors so we can try them in sequence
#         """
#         self._behaviors = rospy.get_param("/move_base_flex/recovery_behaviors")
#         return super(Recovery, self).setup(timeout)

#     def update(self):
#         """
#         Try the next recovery behavior, dropping it from the list
#         """
#         try:
#             self.action_goal = mbf_msgs.RecoveryGoal(behavior=self._behaviors.pop(0)["name"])
#             return super(Recovery, self).update()
#         except IndexError:
#             # recovery behaviors exhausted; fail to abort navigation but restore the list for the next goal
#             # TODO: this means that we won't reset the list after a successful recovery, so the list keeps shrinking
#             # until fully exhausted; that's clearly not the expected operation, so I need to find a better solution
#             self._behaviors = rospy.get_param("/move_base_flex/recovery_behaviors")
#             return py_trees.Status.FAILURE


# ##############################################################################
# # Behaviours
# ##############################################################################

# def create_root():
#     # Create all behaviours
#     bt_root = py_trees.composites.Sequence("MBF BT Demo")
#     get_goal = py_trees.composites.Selector("GetGoal")
#     fallback = py_trees.composites.Selector("Fallback")
#     navigate = py_trees.composites.Sequence("Navigate")
#     new_goal = py_trees_ros.subscribers.ToBlackboard(name="NewGoal",
#                                                      topic_name="/move_base_simple/goal",
#                                                      topic_type=geometry_msgs.PoseStamped,
#                                                      blackboard_variables = {'target_pose': None})
#     have_goal = py_trees.blackboard.CheckBlackboardVariable(name="HaveGoal", variable_name="target_pose")
#     clr_goal1 = py_trees.blackboard.ClearBlackboardVariable(name="ClearGoal", variable_name="target_pose")
#     clr_goal2 = py_trees.blackboard.ClearBlackboardVariable(name="ClearGoal", variable_name="target_pose")
#     get_path = GetPath(name="GetPath",
#                        action_namespace="/move_base_flex/get_path",
#                        action_spec=mbf_msgs.GetPathAction)
#     exe_path = ExePath(name="ExePath",
#                        action_namespace="/move_base_flex/exe_path",
#                        action_spec=mbf_msgs.ExePathAction)
#     recovery = Recovery(name="Recovery",
#                         action_namespace="/move_base_flex/recovery",
#                         action_spec=mbf_msgs.RecoveryAction)

#     # Compose tree
#     bt_root.add_children([get_goal, fallback])
#     get_goal.add_children([have_goal, new_goal])
#     navigate.add_children([get_path, exe_path, clr_goal1])
#     fallback.add_children([navigate, recovery, clr_goal2])
#     return bt_root


# def shutdown(behaviour_tree):
#     behaviour_tree.interrupt()

# if __name__ == '__main__':
#     rospy.init_node("mbf_bt_demo")
#     root = create_root()
#     behaviour_tree = py_trees_ros.trees.BehaviourTree(root)
#     rospy.on_shutdown(functools.partial(shutdown, behaviour_tree))
#     if not behaviour_tree.setup(timeout=15):
#         console.logerror("failed to setup the tree, aborting.")
#         sys.exit(1)

#     behaviour_tree.tick_tock(500)
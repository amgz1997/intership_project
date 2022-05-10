#!/usr/bin/env python
# coding:utf-8

# from __future__ import print_function
# import os
# import roslib
# import rospy
# import smach
# import smach_ros
# import move_base_msgs.msg
# import geometry_msgs.msg
# import tf
# from actionlib import *
# from actionlib_msgs.msg import *
# import std_srvs.srv

# class InputOption(smach.State):
#     """option menu"""        dnum=raw_input('Please select the options:\n0.Go to position0;\n1.Go to position1;\n2.Go to position2;\n3.Move to coordinate;\n4.Exit\n>')
#         if dnum=='4':
#             print('Exit now.')
#             return 'go_out'
#         elif dnum=='3':
#             print('->(x,y)')
#             return 'coordinate'
#         else:
#             userdata.input_numb=int(dnum)
#             print("\nLet's go")
#             return 'go'

# class MoveToCoordinate(smach.State):
#     """run the C++ move_base client"""
#     def __init__(self):
#         super(MoveToCoordinate,self).__init__(outcomes=['succeeded','aborted','preempted'])
    
#     def execute(self,userdata):
#         coor_point=raw_input('Plase inpute the coordinate:x y theta\n')
#         command='rosrun move_base_clients simple_client '+coor_point
#         int_result=os.system(command)
#         if int_result==0:
#             return 'succeeded'
#         elif int_result==1:
#             return 'aborted'
#         elif int_result==2:
#             return 'preempted'
#         else:
#             return 'preempted'

# def main():
#     rospy.init_node('smach_example_actionlib')

#     # Create a SMACH state machine
#     sm0 = smach.StateMachine(outcomes=['succeeded','aborted','preempted'])
#     # Set a list of goals
#     sm0.userdata.goal_list=[[2.303,0.588,0.0],[0.0,0.0,1.0],[0.0,0.0,1.0]] #coordinates of positions
#     sm0.userdata.goal_index=0

#     with sm0:

#         def move_goal_cb(userdata,goal):
#             move_GO=move_base_msgs.msg.MoveBaseGoal()
#             move_GO.target_pose.header.frame_id='map'
#             move_GO.target_pose.header.stamp=rospy.Time.now()
#             move_GO.target_pose.pose.position.x=userdata.list[userdata.index][0]
#             move_GO.target_pose.pose.position.y=userdata.list[userdata.index][1]
#             move_GO.target_pose.pose.position.z=0.0
#             q_angle = tf.transformations.quaternion_from_euler(0.0,0.0,userdata.list[userdata.index][2])
#             q = geometry_msgs.msg.Quaternion(*q_angle)
#             move_GO.target_pose.pose.orientation=q
#             print('Going to ',userdata.list[userdata.index])
#             return move_GO

#         def move_result_cb(userdata, status, result):
#             status_list=['pending','active','preempted','succeeded','aborted','rejected','preempting','recalling','recalled','lost']
#             print('Status is ',status_list[status])
#             print('Index is ',userdata.index)
#             return status_list[status]

#         smach.StateMachine.add('OPTION',
#                                 InputOption(),
#                                 transitions={'go':'MOVE_BASE','go_out':'preempted','coordinate':'GO_TO_COORDINATE'},
#                                 remapping={'input_numb':'goal_index'})
#         smach.StateMachine.add('MOVE_BASE',
#                                smach_ros.SimpleActionState('move_base', move_base_msgs.msg.MoveBaseAction,
#                                goal_cb=move_goal_cb,
#                                result_cb=move_result_cb,
#                                input_keys=['list','index'],
#                                output_keys=['index']),
#                                transitions={'succeeded':'OPTION','aborted':'OPTION','preempted':'preempted'},
#                                remapping={'list':'goal_list','index':'goal_index'})
#         smach.StateMachine.add('GO_TO_COORDINATE',
#                                MoveToCoordinate(),
#                                transitions={'succeeded':'OPTION','aborted':'OPTION','preempted':'preempted'})

#     # Execute SMACH plan
#     outcome = sm0.execute()

#     rospy.signal_shutdown('All done.')

# if __name__ == '__main__':
#     main()

#     ########################################
import rospy
import actionlib
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from geometry_msgs.msg import Point, Quaternion, Pose
from moveit_msgs.msg import MoveGroupGoal, MoveGroupResult, MoveGroupAction, Constraints, MoveItErrorCodes, JointConstraint
from shape_msgs.msg import SolidPrimitive
from std_msgs.msg import Header


# Useful dictionary for reading in a human friendly way the MoveIt! error codes
moveit_error_dict = {}
for name in MoveItErrorCodes.__dict__.keys():
    if not name[:1] == '_':
        code = MoveItErrorCodes.__dict__[name]
        moveit_error_dict[code] = name


def create_move_group_joints_goal(joint_names, joint_values, group="right_arm_torso", plan_only=True):
    """ Creates a move_group goal based on pose.
    @arg joint_names list of strings of the joint names
    @arg joint_values list of digits with the joint values
    @arg group string representing the move_group group to use
    @arg plan_only bool to for only planning or planning and executing
    @return MoveGroupGoal with the desired contents"""
    
    header = Header()
    header.frame_id = 'base_footprint'
    header.stamp = rospy.Time.now()
    moveit_goal = MoveGroupGoal()
    goal_c = Constraints()
    for name, value in zip(joint_names, joint_values):
        joint_c = JointConstraint()
        joint_c.joint_name = name
        joint_c.position = value
        joint_c.tolerance_above = 0.01
        joint_c.tolerance_below = 0.01
        joint_c.weight = 1.0
        goal_c.joint_constraints.append(joint_c)

    moveit_goal.request.goal_constraints.append(goal_c)
    moveit_goal.request.num_planning_attempts = 1
    moveit_goal.request.allowed_planning_time = 15.0
    moveit_goal.planning_options.plan_only = plan_only
    moveit_goal.planning_options.planning_scene_diff.is_diff = True
    moveit_goal.request.group_name = group
    
    return moveit_goal


if __name__=='__main__':
    rospy.init_node("moveit_snippet")

    rospy.loginfo("Connecting to move_group AS")
    moveit_ac = actionlib.SimpleActionClient('move_group', MoveGroupAction)
    moveit_ac.wait_for_server()
    rospy.loginfo("Succesfully connected.")
    
    rospy.loginfo("Creating goal.")
    # Set a list of joint values for the joints specified
    # joint values for right arm 
    joint_names=['torso_lift_joint', 'arm_1_joint', 'arm_1_joint', 
                 'arm_2_joint', 'arm_3_joint', 'arm_4_joint', 
                 'arm_5_joint', 'arm_6_joint','arm_7_joint']
    # this is the arm straight down
    # joint_list_right_arm_straight_down = [-5.85101288255e-05, -0.00100779755239, 9.26099389043e-05,
    #                                       0.000257664105577, -1.55489239528e-06, -0.00244347294573,
    #                                       -2.55958709623e-05]
    
    joint_posi_init=[0.34, 0.21, -1.34, -0.2, 1.94 ,-1.57, 1.37, 0.0]

    # this is the arm in front like if it was going to shake it's hand with someone
    # joint_list_right_arm_shake_hand_pose = [0.376906673976, 0.114372113957, -0.198407737748,
    #                                         1.36616457377, 0.970099953413, 0.108292227188,
    #                                         -0.822999433641]

    joint_list = joint_posi_init
    moveit_goal = create_move_group_joints_goal(joint_names, joint_list, group="right_arm", plan_only=True)
    rospy.loginfo("Sending goal...")
    moveit_ac.send_goal(moveit_goal)
    rospy.loginfo("Waiting for result...")
    moveit_ac.wait_for_result(rospy.Duration(10.0))
    moveit_result = moveit_ac.get_result()
    
    #rospy.loginfo("Got result:\n" + str(moveit_result)) # Uncomment if you want to see the full result message
    #r = MoveGroupResult()
    if moveit_result != None and moveit_result.error_code.val != 1:
        rospy.logwarn("Goal not succeeded: \"" + moveit_error_dict[moveit_result.error_code.val]  + "\"")
    elif moveit_result != None:
        rospy.loginfo("Goal achieved.")
    else:
        rospy.logerr("Couldn't get result, something went wrong, the goal probably timed out.")
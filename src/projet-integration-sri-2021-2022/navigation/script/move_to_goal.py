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
import tf
import rospy
import py_trees
import py_trees_ros
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

# class GetLocationFromQueue(py_trees.behaviour.Behaviour):
#     """ Gets a location name from the queue """
#     def __init__(self, name, location_dict):
#         super(GetLocationFromQueue, self).__init__(name)
#         self.location_dict = location_dict
#         self.bb = py_trees.blackboard.Blackboard()

#     def update(self):
#         """ Checks for the status of the navigation action """
#         loc_list = self.bb.get("loc_list")
#         if len(loc_list) == 0:
#             self.logger.info("No locations available")
#             return py_trees.common.Status.FAILURE
#         else:
#             target_location = loc_list.pop()
#             self.logger.info("Selected location {target_location}")
#             target_pose = self.location_dict[target_location]
#             self.bb.set("target_pose", target_pose)
#             return py_trees.common.Status.SUCCESS

#     def terminate(self, new_status):
#         self.logger.info("Terminated with status {new_status}")


class GoToPose(py_trees.behaviour.Behaviour):
    """ Wrapper behavior around the `move_base` action client """

    def __init__(self, name, pose=None):
        super(GoToPose, self).__init__(name)
        self.client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        self.client.wait_for_server()
        self.pose = pose
        self.bb = py_trees.blackboard.Blackboard()

    def initialise(self):
        """ Sends the initial navigation action goal """
        # Check if there is a pose available in the blackboard
        target_pose = self.bb.get("target_pose")
        if target_pose is not None:
            self.pose = target_pose
        
        x, y, theta = self.pose
        self.logger.info("Going to [x: {x}, y: {y}, theta: {theta}] ...")
        goal = create_move_base_goal(x, y, theta)
        self.client.send_goal(goal)
        rospy.sleep(0.5)    # Ensure goal was received before checking state

    def update(self):
        """ Checks for the status of the navigation action """
        status = self.client.get_state()
        if status == GoalStatus.SUCCEEDED:
            return py_trees.common.Status.SUCCESS
        if status == GoalStatus.ACTIVE:
            return py_trees.common.Status.RUNNING
        else:
            return py_trees.common.Status.FAILURE

    def terminate(self, new_status):
        self.logger.info("Terminated with status {new_status}")
        self.bb.set("target_pose", None)


def create_move_base_goal(x, y, theta):
    """ Creates a MoveBaseGoal message from a 2D navigation pose """
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    quat = tf.transformations.quaternion_from_euler(0, 0, theta)
    goal.target_pose.pose.orientation.x = quat[0]
    goal.target_pose.pose.orientation.y = quat[1]
    goal.target_pose.pose.orientation.z = quat[2]
    goal.target_pose.pose.orientation.w = quat[3]
    return goal

if __name__=="__main__":
    # Start ROS node
    rospy.init_node("navigation_node")

    # Parse locations YAML file
    #location_file = rospy.get_param("location_file")
    # print("Using location file: {location_file}")
    #with open(location_file, "r") as f:
    #   locations = yaml.load(f, Loader=yaml.FullLoader)

    # Navigate goals randomly
    use_behavior_trees = True
    if use_behavior_trees:
        # Create behavior tree from shuffled locations
        root = py_trees.composites.Sequence(name="navigation")
        # loc_list = list(locations.keys())
        # random.shuffle(loc_list)
        #for loc in loc_list:
        pose = create_move_base_goal(2.3, 0.588, 0.0)
        root.add_child(GoToPose("go_to", pose))
        tree = py_trees.trees.BehaviourTree(root)
        ros_tree = py_trees_ros.trees.BehaviourTree(root)
        ros_tree.setup(timeout=10.0)
        py_trees.logging.level = py_trees.logging.Level.INFO

        # Tick the tree until a terminal state is reached
        while not rospy.is_shutdown():
            ros_tree.tick()
            if ros_tree.root.status == py_trees.common.Status.SUCCESS:
                print("Behavior tree succeeded")
                exit()
            elif ros_tree.root.status == py_trees.common.Status.FAILURE:
                print("Behavior tree failed.")
                exit()
            rospy.sleep(0.5)
      
    # else:
    #     # Start move_base client and loop indefinitely
    #     client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
    #     client.wait_for_server()
    #     while not rospy.is_shutdown():
    #        # next_loc = random.choice(list(locations.keys()))
    #         x, y, theta = pose()
    #         print("Selected {next_loc}")
    #         print("Going to [x: {x}, y: {y}, theta: {theta}] ...")
    #         goal = create_move_base_goal(2.3, 0.588, 0.0)
    #         client.send_goal(goal)
    #         result = client.wait_for_result()
    #         print("Action complete with result: {result}")    
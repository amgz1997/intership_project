# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "navigation: 21 messages, 1 services")

set(MSG_I_FLAGS "-Inavigation:/home/pal/intership_project/devel/.private/navigation/share/navigation/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(navigation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" ""
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" "actionlib_msgs/GoalID:navigation/PickUpPoseGoal:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" "actionlib_msgs/GoalID:navigation/PickUpPoseGoal:navigation/PickUpPoseActionGoal:actionlib_msgs/GoalStatus:navigation/PickUpPoseResult:navigation/PickUpPoseActionFeedback:geometry_msgs/Pose:navigation/PickUpPoseActionResult:std_msgs/Header:navigation/PickUpPoseFeedback:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" ""
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" "actionlib_msgs/GoalID:navigation/NavigationGoal:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:navigation/LocalisationResult:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" ""
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" "actionlib_msgs/GoalID:geometry_msgs/Pose:actionlib_msgs/GoalStatus:navigation/LocalisationActionGoal:navigation/LocalisationFeedback:navigation/LocalisationResult:navigation/LocalisationActionFeedback:navigation/LocalisationGoal:std_msgs/Header:navigation/LocalisationActionResult:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" "actionlib_msgs/GoalID:navigation/LocalisationGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" ""
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" "actionlib_msgs/GoalID:navigation/PickUpPoseResult:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" "actionlib_msgs/GoalID:navigation/PickUpPoseFeedback:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" "actionlib_msgs/GoalID:navigation/NavigationFeedback:actionlib_msgs/GoalStatus:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:navigation/NavigationResult:std_msgs/Header"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" ""
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" ""
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:navigation/LocalisationFeedback:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" "actionlib_msgs/GoalID:navigation/NavigationGoal:actionlib_msgs/GoalStatus:navigation/NavigationActionGoal:navigation/NavigationActionFeedback:geometry_msgs/Pose:navigation/NavigationFeedback:std_msgs/Header:navigation/NavigationActionResult:navigation/NavigationResult:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)
_generate_msg_cpp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)

### Generating Services
_generate_srv_cpp(navigation
  "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_cpp(navigation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(navigation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_gencpp)
add_dependencies(navigation_gencpp navigation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)
_generate_msg_eus(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)

### Generating Services
_generate_srv_eus(navigation
  "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_eus(navigation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(navigation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_geneus)
add_dependencies(navigation_geneus navigation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)
_generate_msg_lisp(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)

### Generating Services
_generate_srv_lisp(navigation
  "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_lisp(navigation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(navigation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_genlisp)
add_dependencies(navigation_genlisp navigation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)
_generate_msg_nodejs(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)

### Generating Services
_generate_srv_nodejs(navigation
  "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_nodejs(navigation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(navigation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_gennodejs)
add_dependencies(navigation_gennodejs navigation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg;/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)
_generate_msg_py(navigation
  "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)

### Generating Services
_generate_srv_py(navigation
  "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_py(navigation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(navigation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pal/intership_project/src/projet-integration-sri-2021-2022/navigation/srv/move_base.srv" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionGoal.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationActionResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/PickUpPoseResult.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/LocalisationActionFeedback.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pal/intership_project/devel/.private/navigation/share/navigation/msg/NavigationAction.msg" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_genpy)
add_dependencies(navigation_genpy navigation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(navigation_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(navigation_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(navigation_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(navigation_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(navigation_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(navigation_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(navigation_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(navigation_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(navigation_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(navigation_generate_messages_py geometry_msgs_generate_messages_py)
endif()

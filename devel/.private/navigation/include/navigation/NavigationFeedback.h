// Generated by gencpp from file navigation/NavigationFeedback.msg
// DO NOT EDIT!


#ifndef NAVIGATION_MESSAGE_NAVIGATIONFEEDBACK_H
#define NAVIGATION_MESSAGE_NAVIGATIONFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/PoseStamped.h>

namespace navigation
{
template <class ContainerAllocator>
struct NavigationFeedback_
{
  typedef NavigationFeedback_<ContainerAllocator> Type;

  NavigationFeedback_()
    : current_pose()  {
    }
  NavigationFeedback_(const ContainerAllocator& _alloc)
    : current_pose(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _current_pose_type;
  _current_pose_type current_pose;





  typedef boost::shared_ptr< ::navigation::NavigationFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::navigation::NavigationFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct NavigationFeedback_

typedef ::navigation::NavigationFeedback_<std::allocator<void> > NavigationFeedback;

typedef boost::shared_ptr< ::navigation::NavigationFeedback > NavigationFeedbackPtr;
typedef boost::shared_ptr< ::navigation::NavigationFeedback const> NavigationFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::navigation::NavigationFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::navigation::NavigationFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::navigation::NavigationFeedback_<ContainerAllocator1> & lhs, const ::navigation::NavigationFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.current_pose == rhs.current_pose;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::navigation::NavigationFeedback_<ContainerAllocator1> & lhs, const ::navigation::NavigationFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace navigation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::navigation::NavigationFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::navigation::NavigationFeedback_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::navigation::NavigationFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::navigation::NavigationFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::navigation::NavigationFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::navigation::NavigationFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::navigation::NavigationFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dd7058fae6e1bf2400513fe092a44c92";
  }

  static const char* value(const ::navigation::NavigationFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdd7058fae6e1bf24ULL;
  static const uint64_t static_value2 = 0x00513fe092a44c92ULL;
};

template<class ContainerAllocator>
struct DataType< ::navigation::NavigationFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "navigation/NavigationFeedback";
  }

  static const char* value(const ::navigation::NavigationFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::navigation::NavigationFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Define a feedback message\n"
"geometry_msgs/PoseStamped current_pose\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseStamped\n"
"# A Pose with reference coordinate frame and timestamp\n"
"Header header\n"
"Pose pose\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::navigation::NavigationFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::navigation::NavigationFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.current_pose);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavigationFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::navigation::NavigationFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::navigation::NavigationFeedback_<ContainerAllocator>& v)
  {
    s << indent << "current_pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.current_pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NAVIGATION_MESSAGE_NAVIGATIONFEEDBACK_H

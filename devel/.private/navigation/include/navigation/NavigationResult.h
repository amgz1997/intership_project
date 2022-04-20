// Generated by gencpp from file navigation/NavigationResult.msg
// DO NOT EDIT!


#ifndef NAVIGATION_MESSAGE_NAVIGATIONRESULT_H
#define NAVIGATION_MESSAGE_NAVIGATIONRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace navigation
{
template <class ContainerAllocator>
struct NavigationResult_
{
  typedef NavigationResult_<ContainerAllocator> Type;

  NavigationResult_()
    : result_code(0)  {
    }
  NavigationResult_(const ContainerAllocator& _alloc)
    : result_code(0)  {
  (void)_alloc;
    }



   typedef uint32_t _result_code_type;
  _result_code_type result_code;





  typedef boost::shared_ptr< ::navigation::NavigationResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::navigation::NavigationResult_<ContainerAllocator> const> ConstPtr;

}; // struct NavigationResult_

typedef ::navigation::NavigationResult_<std::allocator<void> > NavigationResult;

typedef boost::shared_ptr< ::navigation::NavigationResult > NavigationResultPtr;
typedef boost::shared_ptr< ::navigation::NavigationResult const> NavigationResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::navigation::NavigationResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::navigation::NavigationResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace navigation

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/melodic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/melodic/share/actionlib_msgs/cmake/../msg'], 'navigation': ['/home/pal/intership_project/devel/.private/navigation/share/navigation/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::navigation::NavigationResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::navigation::NavigationResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::navigation::NavigationResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::navigation::NavigationResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::navigation::NavigationResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::navigation::NavigationResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::navigation::NavigationResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6ef5c02243cd2c6c3b25e8d094bd9470";
  }

  static const char* value(const ::navigation::NavigationResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6ef5c02243cd2c6cULL;
  static const uint64_t static_value2 = 0x3b25e8d094bd9470ULL;
};

template<class ContainerAllocator>
struct DataType< ::navigation::NavigationResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "navigation/NavigationResult";
  }

  static const char* value(const ::navigation::NavigationResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::navigation::NavigationResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Define the result\n"
"uint32 result_code #un numero pour défenir le resultat de la navigation\n"
;
  }

  static const char* value(const ::navigation::NavigationResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::navigation::NavigationResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result_code);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavigationResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::navigation::NavigationResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::navigation::NavigationResult_<ContainerAllocator>& v)
  {
    s << indent << "result_code: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.result_code);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NAVIGATION_MESSAGE_NAVIGATIONRESULT_H

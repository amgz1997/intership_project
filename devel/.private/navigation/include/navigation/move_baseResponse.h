// Generated by gencpp from file navigation/move_baseResponse.msg
// DO NOT EDIT!


#ifndef NAVIGATION_MESSAGE_MOVE_BASERESPONSE_H
#define NAVIGATION_MESSAGE_MOVE_BASERESPONSE_H


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
struct move_baseResponse_
{
  typedef move_baseResponse_<ContainerAllocator> Type;

  move_baseResponse_()
    : A(0)  {
    }
  move_baseResponse_(const ContainerAllocator& _alloc)
    : A(0)  {
  (void)_alloc;
    }



   typedef uint64_t _A_type;
  _A_type A;





  typedef boost::shared_ptr< ::navigation::move_baseResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::navigation::move_baseResponse_<ContainerAllocator> const> ConstPtr;

}; // struct move_baseResponse_

typedef ::navigation::move_baseResponse_<std::allocator<void> > move_baseResponse;

typedef boost::shared_ptr< ::navigation::move_baseResponse > move_baseResponsePtr;
typedef boost::shared_ptr< ::navigation::move_baseResponse const> move_baseResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::navigation::move_baseResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::navigation::move_baseResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::navigation::move_baseResponse_<ContainerAllocator1> & lhs, const ::navigation::move_baseResponse_<ContainerAllocator2> & rhs)
{
  return lhs.A == rhs.A;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::navigation::move_baseResponse_<ContainerAllocator1> & lhs, const ::navigation::move_baseResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace navigation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::navigation::move_baseResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::navigation::move_baseResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::navigation::move_baseResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::navigation::move_baseResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::navigation::move_baseResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::navigation::move_baseResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::navigation::move_baseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "06956f7a0cf92445f3a80f0874388a5a";
  }

  static const char* value(const ::navigation::move_baseResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x06956f7a0cf92445ULL;
  static const uint64_t static_value2 = 0xf3a80f0874388a5aULL;
};

template<class ContainerAllocator>
struct DataType< ::navigation::move_baseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "navigation/move_baseResponse";
  }

  static const char* value(const ::navigation::move_baseResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::navigation::move_baseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint64 A\n"
;
  }

  static const char* value(const ::navigation::move_baseResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::navigation::move_baseResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.A);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct move_baseResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::navigation::move_baseResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::navigation::move_baseResponse_<ContainerAllocator>& v)
  {
    s << indent << "A: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.A);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NAVIGATION_MESSAGE_MOVE_BASERESPONSE_H

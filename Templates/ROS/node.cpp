#include <ros/ros.h>

namespace package_name
{
class NodeName
{
public:
  NodeName(ros::NodeHandle& nh, ros::NodeHandle& private_nh);

private:

};


} // namespace package_name

int main(int argc, char** argv)
{
  ros::init(argc, argv, "node_name");

  ros::NodeHandle nh{};
  ros::NodeHandle private_nh{ "~" };

  package_name::NodeName node_name{ nh, private_nh };

  ros::spin();
  
  return 0;
}


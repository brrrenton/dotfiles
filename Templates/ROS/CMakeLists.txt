cmake_minimum_required(VERSION 3.1.3)

project(project_name)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(catkin REQUIRED COMPONENTS
        roscpp
        )

catkin_package()

add_executable(node_name src/node_name.cpp)
add_dependencies(node_name ${catkin_EXPORTED_TARGETS})
target_include_directories(node_name SYSTEM PRIVATE ${catkin_INCLUDE_DIRS})
target_link_libraries(node_name ${catkin_LIBRARIES})


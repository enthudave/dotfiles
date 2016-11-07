cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

project(project_name)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Qt5Widgets REQUIRED)
add_executable(executable_name main.cpp)
target_link_libraries(executable_name Qt5::Widgets)

#find_package(Qt4 REQUIRED)
#add_executable(subscriber subscriber.cpp)
#target_link_libraries(subscriber Qt4::QtGui Qt4::QtDBus)

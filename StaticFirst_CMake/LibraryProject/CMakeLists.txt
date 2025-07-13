cmake_minimum_required(VERSION 4.0)
set(EXAMPLE_LIBRARY_NAME $ENV{LIBRARY_NAME})

project(DoesItMater LANGUAGES Swift)
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")

add_subdirectory(lib_src)
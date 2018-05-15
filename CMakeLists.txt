project(GLEW)
cmake_minimum_required(VERSION 2.8)

add_definitions(-DGLEW_STATIC)
include_directories(glew-2.1.0/include)
add_library(GLEW STATIC glew-2.1.0/src/glew.c)

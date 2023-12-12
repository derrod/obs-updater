cmake_minimum_required(VERSION 3.22...3.25)

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/bootstrap.cmake" NO_POLICY_SCOPE)

project(obs-updater VERSION "1.0.0.1")

include(compilerconfig)
include(deps)

add_subdirectory(src)

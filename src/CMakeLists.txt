cmake_minimum_required(VERSION 3.24...3.25)

find_package(zstd)
find_package(CURL)
find_package(nlohmann_json 3 REQUIRED)

if(NOT TARGET OBS::blake2)
  add_subdirectory("${CMAKE_SOURCE_DIR}/vendor/blake2" "${CMAKE_BINARY_DIR}/vendor/blake2")
endif()

add_executable(updater WIN32)

target_sources(
  updater
  PRIVATE hash.cpp
          helpers.cpp
          helpers.hpp
          http.cpp
          init-hook-files.c
          manifest.hpp
          patch.cpp
          resource.h
          updater.cpp
          updater.hpp
          updater.manifest
          updater.rc
          util/CoTaskMemPtr.hpp
          util/WinHandle.hpp)

target_compile_options(updater PRIVATE "/utf-8")
target_compile_definitions(updater PRIVATE NOMINMAX "PSAPI_VERSION=2")

target_link_libraries(
  updater
  PRIVATE OBS::blake2
          CURL::libcurl_static
          nlohmann_json::nlohmann_json
          zstd::libzstd_static
          comctl32
          shell32
          winhttp)
target_link_options(updater PRIVATE /IGNORE:4098 "/PDBALTPATH:updater.pdb")

install(TARGETS updater)
install(
  FILES $<TARGET_PDB_FILE:updater>
  DESTINATION bin
  OPTIONAL)

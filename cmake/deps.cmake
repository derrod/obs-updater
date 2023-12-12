include_guard(GLOBAL)

if(NOT EXISTS "${PROJECT_SOURCE_DIR}/deps_build")
  message(FATAL_ERROR "Dependencies have not been build, run deps/Build-Dependencies.ps1 first!")
endif()

list(APPEND CMAKE_PREFIX_PATH "${PROJECT_SOURCE_DIR}/deps_build")

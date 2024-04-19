cmake_minimum_required(VERSION 3.20)

project(carlsimpp-superbuild)

#version 2404

## we have to enable C because it is currently used
## by CMake to describe packages (in Config*.cmake files)
enable_language(C)


# Enable unmerged patches to CMake modules
set(YCM_USE_CMAKE_PROPOSED ON)  

# utilize local cMake modules
#list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(FeatureSummary)

# Load options
include(CARLsim++SuperbuildOptions)

# define hard dependency on YCM
find_package(YCM 0.16.2 REQUIRED)
include(FindOrBuildPackage)
include(YCMEPHelper)

# preliminary libraries
find_package(Boost 1.75 REQUIRED)
find_package(ACE 6.5.12 REQUIRED)
find_package(QT5 5.15.2 REQUIRED)
find_package(SWIG 4.0.2 REQUIRED)

# optional prebuild
#find_package(YARP 3.4.6 COMPONENTS dev os)  # Found YARP
#find_package(Eigen3 3.3.9)                  # move to Build Yarp 
#find_package(Eigen3 3.3.9 HINTS ${CMAKE_BINARY_DIR}/share/eigen3/cmake)  # grade down to syste due long build time
#find_package(Qwt 6.2 REQUIRED)                       # move to Build GUI

# Include the logic of which packages should be built
# depending on which profiles are enabled
include(CARLsim++SuperbuildLogic)
                          
# Octave
if(CARLSIM_USES_MATLAB)  
  # The following line is to properly configure the matlab and simulink software installed by the superbuild
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/startup_carlsimpp_superbuild.m.in ${CMAKE_BINARY_DIR}/startup_carlsimpp_superbuild.m)
endif()

if(WIN32)
    set(SHLIB_ENV_VAR "PATH")
elseif(APPLE)
    set(SHLIB_ENV_VAR "DYLD_LIBRARY_PATH")
else()
    set(SHLIB_ENV_VAR "LD_LIBRARY_PATH")
endif()


if(WIN32)
  # On Git Bash on Windows, C: is rendered as /c
  string(REGEX MATCH "^([A-Z])" PROJECT_SOURCE_DIR_DRIVE ${PROJECT_SOURCE_DIR})
  string(TOLOWER ${PROJECT_SOURCE_DIR_DRIVE} PROJECT_SOURCE_DIR_DRIVE_LOWER)
  string(REGEX REPLACE "^([A-Z]:)" "/${PROJECT_SOURCE_DIR_DRIVE_LOWER}" PROJECT_SOURCE_DIR_SETUP_SH ${PROJECT_SOURCE_DIR})
  string(REGEX MATCH "^([A-Z])" YCM_EP_INSTALL_DIR_DRIVE ${YCM_EP_INSTALL_DIR})
  string(TOLOWER ${YCM_EP_INSTALL_DIR_DRIVE} YCM_EP_INSTALL_DIR_DRIVE_LOWER)
  string(REGEX REPLACE "^([A-Z]:)" "/${YCM_EP_INSTALL_DIR_DRIVE_LOWER}" YCM_EP_INSTALL_DIR_SETUP_SH ${YCM_EP_INSTALL_DIR})
else()
  set(PROJECT_SOURCE_DIR_SETUP_SH ${PROJECT_SOURCE_DIR})
  set(YCM_EP_INSTALL_DIR_SETUP_SH ${YCM_EP_INSTALL_DIR})
endif()

include(ConfigureFileWithCMakeIf)
configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/setup.sh.in ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/setup.sh @ONLY)

if(WIN32)
  file(TO_NATIVE_PATH ${PROJECT_SOURCE_DIR} PROJECT_SOURCE_DIR_NATIVE_PATH)
  file(TO_NATIVE_PATH ${YCM_EP_INSTALL_DIR} YCM_EP_INSTALL_DIR_NATIVE_PATH)
  configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/setup.bat.in ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/setup.bat @ONLY)
  configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/addPathsToUserEnvVariables.ps1.in
                              ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/addPathsToUserEnvVariables.ps1 @ONLY)
  configure_file_with_cmakeif(${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/removePathsFromUserEnvVariables.ps1.in
                              ${YCM_EP_INSTALL_DIR}/share/${PROJECT_NAME}/removePathsFromUserEnvVariables.ps1 @ONLY)
endif()

ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/carlsimpp-superbuild.dot)

set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

#ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/carlsimpp-superbuild.dot pdf)     # std case 
#ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/carlsimpp-superbuild.dot)         # backward compatibility
#ycm_write_dot_file(${CMAKE_CURRENT_BINARY_DIR}/carlsimpp-superbuild.dot png pdf) # full feature 

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
 




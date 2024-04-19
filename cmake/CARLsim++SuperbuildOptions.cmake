
# Copyright (C) Fondazione Istituto Italiano di Tecnologia
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")

# YCM options
option(YCM_DISABLE_SYSTEM_PACKAGES "Disable use of all the system installed packages" ON)


## Other dynamic languages options
option(CARLSIMPP_USES_OCTAVE "Enable compilation of software that depend on Octave" FALSE)

## Find the active version of Python
find_package(Python3 COMPONENTS Interpreter )  # define minimal version   VERSION MINIMUM 3.7
set(PYTHON_VERSION_PATH "python${Python_VERSION_MAJOR}")

option(CARLSIMPP_USES_PYTHON "x" TRUE)
option(CARLSIMPP_USES_MYSQL "x" FALSE)
option(CARLSIMPP_USES_CUDA "x" TRUE)
option(CARLSIMPP_USES_QT "x" TRUE)
option(CARLSIMPP_USES_CARLSIM "x" TRUE)
option(CARLSIMPP_USES_YARP "x" TRUE)
option(CARLSIMPP_USES_RTF "Mirror of Robot-Testing-Framework " FALSE)

# Enable/disable different profiles
option(CARLSIMPP_ENABLE_CORE "Enable compilation of core libraries." TRUE)
option(CARLSIMPP_ENABLE_SERVICE "Enable compilation of service libraries." TRUE)
option(CARLSIMPP_ENABLE_TESTING "Enable testing." TRUE)
option(CARLSIMPP_ENABLE_SNN "Enable SNN tier" TRUE)
option(CARLSIMPP_ENABLE_EDGE "Enable EDGE tier" TRUE)
option(CARLSIMPP_ENABLE_GPU "Enable GPU tier" TRUE)
option(CARLSIMPP_ENABLE_YARP "Enable YARP tier" TRUE)     

# set DEVEL mode for project in WIP to avoid overwrite changes during customizing
set(YCM_EP_DEVEL_MODE_YARP TRUE CACHE BOOL "YARP set into devel mode" FORCE)
#set(YCM_EP_DEVEL_MODE_Eigen3 TRUE CACHE BOOL "Eigen3 set into devel mode" FORCE)

   
# CMake arguments common for all subproject 
#set(YCM_EP_ADDITIONAL_CMAKE_ARGS "-DCARLSIMPP_BOOST_VERSION:STRING=1.76") 
     
    
# color palette 
# https://www.graphviz.org/doc/info/colors.html
    
# background => cloud color    
set(YCM_SNN_COLOR hotpink)
set(YCM_SNN_NODECOLOR hotpink)
set(YCM_SNN_BGCOLOR lavenderblush)

#set(YCM_Core_COLOR cyan)
#set(YCM_Service_COLOR cyan)    

# customer facing => green
set(YCM_GPU_COLOR green)
set(YCM_GPU_NODECOLOR green)
#set(YCM_GPU_BGCOLOR palegreen)
set(YCM_Reenforce_COLOR green)
set(YCM_Reenforce_NODECOLOR green)
set(YCM_MT5_COLOR green)
set(YCM_MT5_NODECOLOR green)

#set(YCM_Service_NODECOLOR blue)    
#set(YCM_Service_BGCOLOR salmon)    

set(YCM_YARP_subsys_COLOR gray45)
set(YCM_YARP_subsys_NODECOLOR gray65)
set(YCM_YARP_subsys_BGCOLOR gray95)
                              
include(CMakeDependentOption)
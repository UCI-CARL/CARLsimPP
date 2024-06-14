
include(YCMEPHelper)

include(FindOrBuildPackage)

find_or_build_package(CARLcpp QUIET)

set(_depends CARLcpp)
if(CARLSIMPP_USES_CARLSIM)
  find_or_build_package(CARLsim6 QUIET)
  list(APPEND _depends CARLsim6)
endif()
if(CARLSIMPP_USES_YARP)
  #find_or_build_package(YARP QUIET)
  list(APPEND _depends YARP)
else()
  unset(YARP_OPTIONAL_CMAKE_ARGS)
endif()

ycm_ep_helper(CARLsimIO  TYPE GIT 
                         STYLE GITHUB
                         REPOSITORY UCI-CARL/CARLsimIO.git
                         #TAG master 
                         TAG feat/raspi5 
                         COMPONENT Core
                         FOLDER src
                         DEPENDS Boost CARLcpp ${_depends}
                         CMAKE_ARGS -DCARLSIMIO_USE_CARLSIM:BOOL=${CARLSIMPP_USES_CARLSIM}                                
                                    -DCARLSIMIO_SUPPORT_YARP=${CARLSIMPP_USES_YARP}
                                    ${YARP_OPTIONAL_CMAKE_ARGS})   
                                    
 

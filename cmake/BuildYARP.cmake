# customized YARP for CARLsim++     

# enforce version 3.4.3 from GitHub
# enforce private fork (mirror) from GitLab


include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(ACE QUIET)

if(CARLSIMPP_USES_PYTHON)
  set(YARP_OPTIONAL_DEPS Python3 SWIG)
endif()

#find_package(SQLite QUIET)   
#find_or_build_package(Eigen3)
#find_package(Eigen3 3.3.9 REQUIRED HINTS $CMAKE_BINARY_DIR/installed/eigen-3.3.9)  # grade down to syste due long build time

ycm_ep_helper(YARP TYPE GIT

                   STYLE GITHUB
                   REPOSITORY robotology/yarp.git      
                   TAG v3.4.6      # YARP without yarpdatadumper, v3.5 with VOCAB32 patch
                                      
                   COMPONENT YARP_subsys
                   FOLDER src
                   DEPENDS YCM
                           ACE
                           Eigen3
                           ${YARP_OPTIONAL_DEPS}
                   CMAKE_ARGS -DYARP_COMPILE_GUIS:BOOL=ON
                              #-DYARP_USE_SYSTEM_SQLite:BOOL=ON                              
                              -DYARP_COMPILE_libYARP_math:BOOL=ON
                              -DYARP_COMPILE_CARRIER_PLUGINS:BOOL=ON
                              -DYARP_COMPILE_yarpdatadumper:BOOL=OFF    # 3.4.6                              
                              -DENABLE_yarpcar_bayer:BOOL=OFF
                              -DENABLE_yarpcar_tcpros:BOOL=OFF
                              -DENABLE_yarpcar_xmlrpc:BOOL=OFF
                              -DENABLE_yarpcar_priority:BOOL=ON
                              -DENABLE_yarpcar_bayer:BOOL=OFF
                              -DENABLE_yarpcar_mjpeg:BOOL=OFF
                              -DENABLE_yarpcar_portmonitor:BOOL=ON
                              -DENABLE_yarpcar_depthimage:BOOL=OFF
                              -DENABLE_yarpcar_depthimage2:BOOL=OFF
                              -DENABLE_yarpidl_thrift:BOOL=OFF
                              -DYARP_COMPILE_DEVICE_PLUGINS:BOOL=ON
                              -DENABLE_yarpcar_human:BOOL=OFF
                              -DENABLE_yarpcar_rossrv:BOOL=OFF
                              -DENABLE_yarpmod_fakebot:BOOL=ON
                              -DENABLE_yarpmod_imuBosch_BNO055:BOOL=OFF
                              -DENABLE_yarpmod_SDLJoypad:BOOL=OFF
                              -DENABLE_yarpmod_serialport:BOOL=OFF
                              -DENABLE_yarpmod_AudioPlayerWrapper:BOOL=ON
                              -DENABLE_yarpmod_AudioRecorderWrapper:BOOL=ON
                              -DENABLE_yarpmod_portaudio:BOOL=OFF
                              -DENABLE_yarpmod_portaudioPlayer:BOOL=OFF
                              -DENABLE_yarpmod_portaudioRecorder:BOOL=OFF
                              -DYARP_COMPILE_EXPERIMENTAL_WRAPPERS:BOOL=OFF                              
                              -DYARP_COMPILE_RobotTestingFramework_ADDONS:BOOL=${CARLSIMPP_ENABLE_ROBOT_TESTING}
                              -DYARP_USE_RobotTestingFramework:BOOL=ON
                              -DYARP_COMPILE_BINDINGS:BOOL=${CARLSIMPP_USES_PYTHON} # OR ${CARLSIMPP_USES_JAVA}  -> Ecj
                              -DYARP_USE_I2C:BOOL=OFF
                              -DYARP_USE_SDL:BOOL=ON
                              -DCREATE_PYTHON:BOOL=${CARLSIMPP_USES_PYTHON}
                              #-DCREATE_PYTHON:BOOL=${CARLSIMPP_USES_JAVA}  # Ecj
                              -DCREATE_LUA:BOOL=OFF
                              -DENABLE_yarpmod_usbCamera:BOOL=${ENABLE_USBCAMERA}
                              -DYARP_ENABLE_YARPRUN_LOG:BOOL=ON
                              -DCMAKE_INSTALL_BINDIR:PATH=$<$<CONFIG:Debug$<ANGLE-R>:debug/$<ANGLE-R>bin                              
                              ${YARP_OPTIONAL_CMAKE_ARGS})

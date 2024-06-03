
include(YCMEPHelper)

list(APPEND _DEPENDS GTest)

if(CARLSIMPP_USES_CUDA)
  set(CARLSIM_NO_CUDA OFF)
  list(APPEND _DEPENDS CUDA CudaSamples)  
else()
  set(CARLSIM_NO_CUDA ON)
endif()

if(CARLSIMPP_USES_PYTHON)
  list(APPEND _DEPENDS Python3 PyNN SWIG)
endif()

if(${CARLSIMPP_USES_OCTAVE})
  list(APPEND _DEPENDS Octave)
endif()


ycm_ep_helper(CARLsim6 TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY UCI-CARL/CARLsim6.git		  
        #TAG development
			  COMPONENT SNN 
			  FOLDER src
        DEPENDS ${_DEPENDS}
        CMAKE_ARGS -DCARLSIM_NO_CUDA:BOOL=ON  # (NOT ${CARLSIMPP_USES_CUDA})
                   -DCARLSIM_PYCARL:BOOL=${CARLSIMPP_USES_PYTHON}   
                   -DCARLSIM_LN_EXT:BOOL=ON    # see carlsim_conf.h
                   -DCARLSIM_LN_FIRING:BOOL=ON    
                   -DCARLSIM_LN_FIX_DA_DECAY:BOOL=TRUE    
                   -DCARLSIM_LN_GPU_INFO=(NOT ${CARLSIMPP_USES_CUDA})    
                   -DCARLSIM_CUDA_SAMPLES_INCLUDE_DIR:PATH=${CMAKE_CURRENT_SOURCE_DIR}/src/CudaSamples/Common
					-DCMAKE_CONFIGURATION_TYPES:STRING=Debug;Release
				    -DCMAKE_CXX_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3 /GR /EHsc /MP
					-DCMAKE_CXX_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1
					-DCMAKE_CXX_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG
					-DCMAKE_C_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3
					-DCMAKE_C_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1
					-DCMAKE_C_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG
                   ${YARP_OPTIONAL_CMAKE_ARGS})	
                   
                   
#-DCMAKE_INSTALL_BINDIR:PATH=$<$<CONFIG:Debug$<ANGLE-R>:debug/$<ANGLE-R>bin                    
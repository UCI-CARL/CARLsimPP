include(YCMEPHelper)

find_or_build_package(YarpLibCarl)

ycm_ep_helper(YarpDevCarlEpuck2 TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY UCI-CARL/YarpDevCarlEpuck2.git		
			  #TAG master
			  TAG feat/raspi5                          
			  #COMPONENT YARP_subsys   robot
			  FOLDER src
        DEPENDS YARP YarpLibCarl             
        CMAKE_ARGS ${YARP_OPTIONAL_CMAKE_ARGS}
        )	
                   
                    

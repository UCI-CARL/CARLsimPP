include(YCMEPHelper)

find_or_build_package(YarpLibCarl)

ycm_ep_helper(YarpDevCarlWb TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY UCI-CARL/YarpDevCarlWb.git		
			  TAG master
			  #COMPONENT YARP_subsys   robot
			  FOLDER src
        DEPENDS YARP YarpLibCarl            
        CMAKE_ARGS ${YARP_OPTIONAL_CMAKE_ARGS}
        )	
                   
                    
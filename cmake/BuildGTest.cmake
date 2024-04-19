
include(YCMEPHelper)

ycm_ep_helper(GTest TYPE GIT 
				STYLE GITHUB
				REPOSITORY google/googletest.git
				TAG release-1.11.0
				COMPONENT SNN
				FOLDER src
				CMAKE_ARGS -DBUILD_SHARED_LIBS:BOOL=ON
			)	
        
        
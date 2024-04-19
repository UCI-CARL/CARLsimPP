
include(YCMEPHelper)

ycm_ep_helper(CudaSamples TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY NVIDIA/cuda-samples.git
			  TAG v11.8
			  COMPONENT YARP_subsys
        FOLDER src
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        TEST_COMMAND ""
        )	
        
        
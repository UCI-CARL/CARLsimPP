
include(YCMEPHelper)

ycm_ep_helper(Eigen3 TYPE GIT 
			  STYLE GITLAB
			  REPOSITORY https://gitlab.com/libeigen/eigen
			  TAG 3.3.9
			  COMPONENT YARP_subsys
        FOLDER src)	
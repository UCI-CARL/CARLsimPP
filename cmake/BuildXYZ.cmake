
include(YCMEPHelper)

ycm_ep_helper(Xyz TYPE GIT 
			  STYLE GITLAB
			  REPOSITORY https://gitlab.com/ncch/xyz.git
			  TAG develop
			  COMPONENT Cockroach
        FOLDER src)	
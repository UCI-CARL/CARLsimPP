
include(YCMEPHelper)

#find_or_build_package(CARLsim6 QUIET)
#find_or_build_package(SpikeStream QUIET)
#find_or_build_package(FinspikesWrapper QUIET)

ycm_ep_helper(CarlsimWrapper TYPE GIT 
			  STYLE GITLAB
			  REPOSITORY https://gitlab.com/ncch/carlsimwrapper.git
			  TAG master
			  COMPONENT SNN
			  FOLDER src
        DEPENDS CARLsim6 SpikeStream QT5)	
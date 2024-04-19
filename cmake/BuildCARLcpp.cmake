
# central c++ header lib based on Boost

include(YCMEPHelper)

ycm_ep_helper(CARLcpp TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY UCI-CARL/CARLcpp.git
			  TAG master
			  COMPONENT Core
			  FOLDER src
        DEPENDS Boost )	
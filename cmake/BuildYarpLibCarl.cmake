
# Central Lib shared by yarp, finspikes,  (alternate name: ncutils , nccore)

include(YCMEPHelper)
  

ycm_ep_helper(YarpLibCarl TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY UCI-CARL/YarpLibCarl.git
			  TAG master
			  COMPONENT Core
			  FOLDER src
        DEPENDS YARP CARLcpp)     	
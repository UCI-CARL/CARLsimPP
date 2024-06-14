
include(YCMEPHelper)


ycm_ep_helper(Service TYPE GIT 
			  STYLE GITHUB
			  REPOSITORY UCI-CARL/CARLsimService.git
        #TAG master
        TAG feat/raspi5        
			  COMPONENT Core
			  FOLDER src
        DEPENDS )	

# customized 2021 for CARLsim++ 


include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(RobotTestingFramework TYPE GIT
                                    #STYLE GITHUB
                                    #REPOSITORY robotology/robot-testing-framework.git
                                    STYLE GITLAB
                                    REPOSITORY https://gitlab.com/ncch/rtf-mirror.git      
                                    TAG feature/rtf3
                                    CMAKE_ARGS -DENABLE_LUA_PLUGIN:BOOL=OFF
                                               -DENABLE_PYTHON_PLUGIN:BOOL=${CARLSIMPP_USES_PYTHON}
                                    COMPONENT test
                                    FOLDER src
                                    CMAKE_ARGS -DCMAKE_INSTALL_BINDIR:PATH=$<$<CONFIG:Debug$<ANGLE-R>:debug/$<ANGLE-R>bin  
                                    )


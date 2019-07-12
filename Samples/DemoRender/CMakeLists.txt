cmake_minimum_required( VERSION 3.12.1 ) # Latest version of CMake when this file was created.

set( HEADER_FILES
    Common/Camera.h
    Common/d3dApp.h
	Common/d3dUtil.h
	Common/d3dx12.h
	Common/DDSTextureLoader.h
	Common/GameTimer.h
	Common/GeometryGenerator.h
	Common/MathHelper.h
	Common/UploadBuffer.h
	./FrameResource.h
	./Waves.h
)

source_group( "My_Header_Files" FILES ${HEADER_FILES} )

set( SRC_FILES
    Common/Camera.cpp
    Common/d3dApp.cpp
	Common/d3dUtil.cpp
	Common/DDSTextureLoader.cpp
	Common/GameTimer.cpp
	Common/GeometryGenerator.cpp
	Common/MathHelper.cpp
	./FrameResource.cpp
	./LandAndWavesApp.cpp
	./Waves.cpp
)

source_group( "My_SRC_Files" FILES ${SRC_FILES} )

# set( VERTEX_SHADER_FILES 
    #Shaders/color.hlsl
#)

#set( PIXEL_SHADER_FILES
#    shaders/HDR_PS.hlsl
#    shaders/HDRtoSDR_PS.hlsl
#    shaders/Skybox_PS.hlsl
#)

set( SHADER_FILES
    #${VERTEX_SHADER_FILES}
    #${PIXEL_SHADER_FILES}
	Shaders/color.sl
)

source_group( "Resources\\Shaders" FILES ${SHADER_FILES} )

#set_source_files_properties( ${SHADER_FILES} 
#    PROPERTIES
#        VS_SHADER_OBJECT_FILE_NAME "${CMAKE_CURRENT_SOURCE_DIR}/Data/Shaders/DX_Tutorial/%(Filename).cso"
#        VS_SHADER_MODEL 5.1
#        VS_SHADER_DISABLE_OPTIMIZATIONS $<$<CONFIG:Debug>:ON>
#        VS_SHADER_ENABLE_DEBUG $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:ON>
#)

#set_source_files_properties( ${VERTEX_SHADER_FILES}
#    PROPERTIES 
#        VS_SHADER_TYPE Vertex
#)

#set_source_files_properties( ${PIXEL_SHADER_FILES}
#    PROPERTIES 
#        VS_SHADER_TYPE Pixel
#)

add_definitions(-D_UNICODE)

add_executable( DemoRender WIN32
    ${HEADER_FILES} 
    ${SRC_FILES}
    ${SHADER_FILES}
)

target_include_directories( DemoRender
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc
)

target_link_libraries( DemoRender
    #DX12Lib
    D3DCompiler.lib
    Shlwapi.lib
)

# Set debug database to enable the "Edit and Continue" feature.
target_compile_options( DemoRender
    PRIVATE $<$<CONFIG:Debug>:/ZI>
)

# Set Local Debugger Settings (Command Arguments and Environment Variables)
#set( COMMAND_ARGUMENTS "-wd \"${CMAKE_CURRENT_SOURCE_DIR}\"" )
set_property(TARGET DemoRender PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")

#configure_file( DemoRender.vcxproj.user.in ${CMAKE_CURRENT_BINARY_DIR}/DemoRender.vcxproj.user @ONLY )

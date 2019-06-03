cmake_minimum_required( VERSION 3.12.1 ) # Latest version of CMake when this file was created.

set( HEADER_FILES
    inc/Camera.h
    inc/Light.h
    inc/Material.h
    inc/DX_Tutorial.h
)

set( SRC_FILES
    src/Camera.cpp
    src/main.cpp
    src/Light.cpp
    src/Material.cpp
    src/DX_Tutorial.cpp
)

set( VERTEX_SHADER_FILES 
    shaders/HDR_VS.hlsl
    shaders/HDRtoSDR_VS.hlsl
    shaders/Skybox_VS.hlsl
)

set( PIXEL_SHADER_FILES
    shaders/HDR_PS.hlsl
    shaders/HDRtoSDR_PS.hlsl
    shaders/Skybox_PS.hlsl
)

set( SHADER_FILES
    ${VERTEX_SHADER_FILES}
    ${PIXEL_SHADER_FILES}
)

source_group( "Resources\\Shaders" FILES ${SHADER_FILES} )

set_source_files_properties( ${SHADER_FILES} 
    PROPERTIES
        VS_SHADER_OBJECT_FILE_NAME "${CMAKE_CURRENT_SOURCE_DIR}/Data/Shaders/DX_Tutorial/%(Filename).cso"
        VS_SHADER_MODEL 5.1
        VS_SHADER_DISABLE_OPTIMIZATIONS $<$<CONFIG:Debug>:ON>
        VS_SHADER_ENABLE_DEBUG $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:ON>
)

set_source_files_properties( ${VERTEX_SHADER_FILES}
    PROPERTIES 
        VS_SHADER_TYPE Vertex
)

set_source_files_properties( ${PIXEL_SHADER_FILES}
    PROPERTIES 
        VS_SHADER_TYPE Pixel
)

add_executable( DX_Tutorial WIN32
    ${HEADER_FILES} 
    ${SRC_FILES}
    ${SHADER_FILES}
)

target_include_directories( DX_Tutorial
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc
)

target_link_libraries( DX_Tutorial
    DX12Lib
    D3DCompiler.lib
    Shlwapi.lib
)

# Set debug database to enable the "Edit and Continue" feature.
target_compile_options( DX_Tutorial
    PRIVATE $<$<CONFIG:Debug>:/ZI>
)

# Set Local Debugger Settings (Command Arguments and Environment Variables)
set( COMMAND_ARGUMENTS "-wd \"${CMAKE_CURRENT_SOURCE_DIR}\"" )
configure_file( DX_Tutorial.vcxproj.user.in ${CMAKE_CURRENT_BINARY_DIR}/DX_Tutorial.vcxproj.user @ONLY )

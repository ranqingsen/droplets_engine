cmake_minimum_required( VERSION 3.12.0 ) # Latest version of CMake when this file was created.

add_subdirectory( DX12Lib )
add_subdirectory( DirectXTex )

set_target_properties (DX12Lib PROPERTIES
    FOLDER Engine/Source/Runtime
)

set_target_properties (DirectXTex PROPERTIES
    FOLDER Engine/Source/Runtime
)
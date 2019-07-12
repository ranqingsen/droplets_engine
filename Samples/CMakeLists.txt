cmake_minimum_required( VERSION 3.12.0 ) # Latest version of CMake when this file was created.

add_subdirectory( DemoRender )

set_target_properties (DemoRender PROPERTIES
    FOLDER Samples
)
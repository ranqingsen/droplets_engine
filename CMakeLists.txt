cmake_minimum_required( VERSION 3.12.0 ) # Latest version of CMake when this file was created.

# Use solution folders to organize projects
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(BINS "Binaries")

# Make sure DLL and EXE targets go to the same directory.
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${BINS}/lib) # Output directory for static lib (.LIB)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${BINS}/bin) # Output directory for shared lib (.DLL)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BINS}/bin) # Output directory for executables (.EXE)

project( Droplets LANGUAGES CXX )

# The version number.
set (ENGINE_VERSION_MAJOR 1)
set (ENGINE_VERSION_MINOR 0)

# Enable multithreaded builds
if( MSVC )
    add_compile_options(/MP)
endif()

add_subdirectory( Engine )
add_subdirectory( Samples )

# Set the startup project.
set_directory_properties( PROPERTIES 
    VS_STARTUP_PROJECT DemoRender
)
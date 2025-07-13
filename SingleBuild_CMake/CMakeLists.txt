cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})
set(EXAMPLE_LIBRARY_NAME MyFancyResponseHandler)

project(${PROJECT_NAME} 
    LANGUAGES Swift
    # VERSION 0.1.0
)

add_subdirectory("lib_src/")
add_subdirectory("hello_src/")


#[[
## NOTE: Could still do this if the lib source was NOT in this CMake root
## The trick is to provide a location to build the library into as a second
## parameter to the `add_subdirectory` call.

## For Example

set(OUTSIDE_LIBS_LOCATION ../../OUTSIDE)

add_subdirectory(
    ${OUTSIDE_LIBS_LOCATION}/${EXAMPLE_LIBRARY_NAME}
    ${CMAKE_CURRENT_BINARY_DIR}/${EXAMPLE_LIBRARY_NAME}
)
]]

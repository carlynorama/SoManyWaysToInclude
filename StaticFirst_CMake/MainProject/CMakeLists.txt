cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME SomeProjectName)
set(MAIN_TARGET_NAME $ENV{EXE_TARGET_NAME})
set(EXAMPLE_LIBRARY_NAME $ENV{LIBRARY_NAME})

project(${PROJECT_NAME} 
    LANGUAGES Swift
)

set(EXAMPLE_LIBRARY_DIR $ENV{EXAMP_LIB_INSTALL_DIR})

add_library(${EXAMPLE_LIBRARY_NAME} STATIC IMPORTED)
set_target_properties(${EXAMPLE_LIBRARY_NAME} PROPERTIES
    IMPORTED_LOCATION               "${EXAMPLE_LIBRARY_DIR}/lib${EXAMPLE_LIBRARY_NAME}.a"
    INTERFACE_INCLUDE_DIRECTORIES   "${EXAMPLE_LIBRARY_DIR}"
)

add_subdirectory("hello_src/")
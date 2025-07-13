cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME SomeProjectName)
set(MAIN_TARGET_NAME $ENV{EXE_TARGET_NAME})

set(EXAMPLE_LIBRARY_NAME $ENV{LIBRARY_NAME})
set(EXAMPLE_LIBRARY_DIR $ENV{TEST_INSTALL_DIR}/lib/swift_static)

project(${PROJECT_NAME} 
    LANGUAGES Swift
)

# Can offer up other options...
#   IMPORTED_LOCATION_DEBUG
#   IMPORTED_LOCATION_RELEASE
#   IMPORTED_LOCATION_RELWITHDEBINFO
add_library(${EXAMPLE_LIBRARY_NAME} STATIC IMPORTED)
set_target_properties(${EXAMPLE_LIBRARY_NAME} PROPERTIES
    IMPORTED_LOCATION               "${EXAMPLE_LIBRARY_DIR}/lib${EXAMPLE_LIBRARY_NAME}.a"
    INTERFACE_INCLUDE_DIRECTORIES   "${EXAMPLE_LIBRARY_DIR}/${EXAMPLE_LIBRARY_NAME}.swiftmodule"
)

add_subdirectory("hello_src/")
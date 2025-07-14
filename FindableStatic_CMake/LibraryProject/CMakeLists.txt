cmake_minimum_required(VERSION 4.0)

set(EXAMPLE_LIBRARY_NAME $ENV{LIBRARY_NAME})
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake/modules)
list(APPEND CMAKE_MODULE_PATH $ENV{SHARED_CMAKE_MODULES_DIR})

project(DoesItMater LANGUAGES Swift)
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")


include(MYInstallDirs)
MyInstallDirs_set_common_dir_values()
message("------ BINDIR: ${CMAKE_INSTALL_BINDIR}")
message("------ LIBDIR: ${CMAKE_INSTALL_LIBDIR}")
message("------ INCLUDEDDIR: ${CMAKE_INSTALL_INCLUDEDIR}")

include(SwiftInstallModuleSupport)
setup_swift_install_vars()
message("------ SWIFT_SYSTEM_NAME: ${SWIFT_SYSTEM_NAME}")
message("------ Swift_MODULE_DIRECTORY: ${CMAKE_Swift_MODULE_DIRECTORY}")

include(FindableLibrarySupport)

add_subdirectory(lib_src)

# install(FILES $<TARGET_PROPERTY:${EXAMPLE_LIBRARY_NAME},Swift_MODULE_DIRECTORY>/${EXAMPLE_LIBRARY_NAME}.swiftdoc
# DESTINATION LIB_DESTINATION${EXAMPLE_LIBRARY_NAME}.swiftmodule
# RENAME ${SwiftFoundation_MODULE_TRIPLE}.swiftdoc)
# install(FILES $<TARGET_PROPERTY:${module},Swift_MODULE_DIRECTORY>/${module_name}.swiftmodule
# DESTINATION lib/${swift}/${swift_os}/${module_name}.swiftmodule
# RENAME ${SwiftFoundation_MODULE_TRIPLE}.swiftmodule)
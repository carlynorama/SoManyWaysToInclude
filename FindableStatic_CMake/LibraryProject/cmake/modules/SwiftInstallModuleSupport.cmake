# https://github.com/swiftlang/swift-foundation/blob/64fff9d369a4491ad33b34c554a9d527b4a0727c/cmake/modules/SwiftFoundationSwiftSupport.cmake#L25
# https://github.com/swiftlang/swift/blob/439afd640693cf45f2d2f5f60f4c6586d7020ca9/Runtimes/Supplemental/Synchronization/CMakeLists.txt#L55
# Returns the os name in a variable
#
# Usage:
#   get_swift_host_os(result_var_name)
#
#
# Sets ${result_var_name} with the converted OS name derived from

# CMAKE_SYSTEM_NAME.

macro(setup_swift_install_vars)
  if(NOT SWIFT_SYSTEM_NAME)
    if(CMAKE_SYSTEM_NAME STREQUAL Darwin)
      set(SWIFT_SYSTEM_NAME macosx)
    else()
      set(SWIFT_SYSTEM_NAME "$<LOWER_CASE:${CMAKE_SYSTEM_NAME}>")
    endif()
  endif()

  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
  set(CMAKE_Swift_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/swift)
  
endmacro()



function(get_swift_host_os result_var_name)
  set(${result_var_name} ${SWIFT_SYSTEM_NAME} PARENT_SCOPE)
endfunction()


# function(fix_module_emission this_target)
#   set_target_properties(${this_target} PROPERTIES
#     Swift_MODULE_DIRECTORY hello_sunshine
#   )
# endfunction()

function(install_swift_target this_target)
  get_swift_host_os(swift_os)
  get_target_property(type ${this_target} TYPE)

  if(type STREQUAL STATIC_LIBRARY)
    set(swift swift_static)
  else()
    set(swift swift)
  endif()

  install(TARGETS ${this_target}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/${swift}/${swift_os}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/${swift}/${swift_os}
    # ARCHIVE DESTINATION lib/${swift}/${swift_os}
    # LIBRARY DESTINATION lib/${swift}/${swift_os}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
  if(type STREQUAL EXECUTABLE)
    return()
  endif()

  get_target_property(module_name ${this_target} Swift_MODULE_NAME)
  if(NOT module_name)
    set(module_name ${this_target})
  endif()

  # get_target_property(<variable> <target> <property>)
  get_target_property(module_files_dir ${this_target} Swift_MODULE_DIRECTORY)
  message(------------ module_dir ${module_files_dir} ------------------)

  if(NOT module_files_dir)
    # TODO: 
    message("MOVE EACH FILE IF THEY AREN'T IN A FOLDER")
    # install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${module_name}.swiftmodule
    #   DESTINATION lib/${swift}/${swift_os}/${module_name}.swiftmodule
    #   # RENAME ${${module_name}_MODULE_TRIPLE}.swiftmodule
    # )
  else()
    # don't forget the trailing slash!!! w/o it it will move the enclosing dir
    # and not just the files. That may be what's better post 4.1?
    install(DIRECTORY ${CMAKE_BINARY_DIR}/${module_files_dir}/
      DESTINATION ${CMAKE_INSTALL_LIBDIR}/${swift}/${swift_os}/${module_name}.swiftmodule
    )
  endif()

endfunction()
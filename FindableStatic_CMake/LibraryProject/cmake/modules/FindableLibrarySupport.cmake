include(CMakePackageConfigHelpers)

function(make_findable_version_files this_target version major_component)
    set_property(TARGET ${this_target} PROPERTY VERSION ${version})
    set_property(TARGET ${this_target} PROPERTY SOVERSION ${major_component})
    set_property(TARGET ${this_target} PROPERTY
        INTERFACE_${this_target}_MAJOR_VERSION ${major_component})
        set_property(TARGET ${this_target} APPEND PROPERTY
        COMPATIBLE_INTERFACE_STRING ${this_target}_MAJOR_VERSION
    )

    # generate the version file for the config file
    write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/${this_target}ConfigVersion.cmake"
        VERSION "${version}"
        COMPATIBILITY AnyNewerVersion
    )

    install(FILES
            "${CMAKE_CURRENT_BINARY_DIR}/${this_target}ConfigVersion.cmake"
            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/
    )
    
endfunction(make_findable_version_files version major_component)

function(make_findable_target this_target)

    target_include_directories(${this_target}
        PUBLIC
            "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
            "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
    )

    install(TARGETS ${this_target}
        EXPORT ${this_target}Targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

    install(EXPORT ${this_target}Targets
        FILE ${this_target}Targets.cmake
        NAMESPACE ${this_target}::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/
    )

    

    configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
        "${CMAKE_CURRENT_BINARY_DIR}/${this_target}Config.cmake"
        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/
    )

    install(FILES
          "${CMAKE_CURRENT_BINARY_DIR}/${this_target}Config.cmake"
          "${CMAKE_CURRENT_BINARY_DIR}/${this_target}ConfigVersion.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/
    )

endfunction()

# to be honest I don't understand this yet but it mentioned cross compiling...
function(enable_non_install this_target)
    export(EXPORT ${this_target}Targets
        FILE "${CMAKE_CURRENT_BINARY_DIR}/cmake/${this_target}Targets.cmake"
        NAMESPACE ${this_target}::
    )
endfunction(enable_cross_)
add_library(${EXAMPLE_LIBRARY_NAME} Responder.swift)


make_findable_version_files(${EXAMPLE_LIBRARY_NAME} 2.0.1 2)
make_findable_target(${EXAMPLE_LIBRARY_NAME})

# fix_module_emission(${EXAMPLE_LIBRARY_NAME})
install_swift_target(${EXAMPLE_LIBRARY_NAME})
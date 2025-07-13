add_library(${EXAMPLE_LIBRARY_NAME} Responder.swift)

fix_module_emission(${EXAMPLE_LIBRARY_NAME})
install_swift_target(${EXAMPLE_LIBRARY_NAME})
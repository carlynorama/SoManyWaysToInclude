add_executable(${MAIN_TARGET_NAME} Hello.swift Extra.swift)
message("-------------- $ENV{LIBRARY_EXPORT_DIR} ----------------")
include_directories($ENV{LIBRARY_EXPORT_DIR})
target_link_libraries(${MAIN_TARGET_NAME} PRIVATE ${EXAMPLE_LIBRARY_NAME})

set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")
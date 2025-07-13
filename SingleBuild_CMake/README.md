
## To Use




## Notes

Could still do this if the lib source was NOT in this CMake root. The trick is to provide a location to build the library into as a second parameter to the `add_subdirectory` call.

For Example:

```cmake
set(OUTSIDE_LIBS_LOCATION ../../OUTSIDE)

add_subdirectory(
    ${OUTSIDE_LIBS_LOCATION}/${EXAMPLE_LIBRARY_NAME}
    ${CMAKE_CURRENT_BINARY_DIR}/${EXAMPLE_LIBRARY_NAME}
)
```
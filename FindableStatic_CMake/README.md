
## To Use

```
zsh ./build_n_run.sh
```

in this directory. 

## Notes

This build script runs two separate CMake Builds. First for LibraryProject, then for MainProject.  

It uses the CMake INSTALL commands to move the needed files to a "shared location" 

This example is missing many of the niceties that a real static library should provide, like files for different configs (release vs debug) and architectures. 


- https://cmake.org/cmake/help/latest/prop_tgt/Swift_MODULE_DIRECTORY.html
- https://cmake.org/cmake/help/latest/search.html?q=SWIFT_
- https://github.com/swiftlang/swift-corelibs-foundation/blob/0e489e921d7325d220dab368d174d9b7bcb5db75/cmake/modules/FoundationSwiftSupport.cmake#L27

//YES!!!
- is it hello_src/CMakeFiles/hello.dir//output-file-map.json ???
- /Users/${USER}/Developer/GitHub/SoManyWaysToInclude/FindableStatic_CMake/MainProject/build/hello_src/CMakeFiles/hello.dir/output-file-map.json
- /Users/${USER}/Developer/GitHub/SoManyWaysToInclude/FindableStatic_CMake/LibraryProject/build/lib_src/CMakeFiles/MyFancyResponseHandler.dir/output-file-map.json

- /Users/${USER}/.pico-sdk/cmake/v3.28.6/CMake.app/Contents/share/cmake-3.28/Modules/GNUInstallDirs.cmake
- /opt/homebrew/Cellar/cmake/4.0.3/share/cmake/Modules/GNUInstallDirs.cmake


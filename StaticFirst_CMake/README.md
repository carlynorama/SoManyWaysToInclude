
## To Use

```
zsh ./build_n_run.sh
```

in this directory. 

## Notes

This build script runs two separate CMake Builds. First for LibraryProject, then for MainProject.  It's bad practice, but the MainProject CMakeLists.txt gets handed the build folder of the LibraryProject as the location to use. 



# Assumes repo lives in /Users/${USER}/Developer/GitHub/
cd MainProject/build
/usr/bin/swiftc -j 10 -num-threads 10 -c  -module-name hello  -parse-as-library -incremental -output-file-map hello_src/CMakeFiles/hello.dir/output-file-map.json -I /Users/${USER}/Developer/GitHub/SoManyWaysToInclude/FindableStatic_CMake/FAKE/INSTALL/LOCATION/lib /Users/${USER}/Developer/GitHub/SoManyWaysToInclude/FindableStatic_CMake/MainProject/hello_src/Hello.swift /Users/${USER}/Developer/GitHub/SoManyWaysToInclude/FindableStatic_CMake/MainProject/hello_src/Extra.swift
cd ..
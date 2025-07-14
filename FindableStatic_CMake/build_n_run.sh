#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR

export SHARED_CMAKE_MODULES_DIR=$SCRIPT_DIR/shared/cmake/modules
export TEST_INSTALL_DIR=$SCRIPT_DIR/FAKE/INSTALL/LOCATION

SRC_LIB_DIR=$SRCROOT/LibraryProject
BUILD_LIB_DIR=$SRC_LIB_DIR/build
NAME_LIB="MyFancyResponseHandler"
export LIBRARY_NAME=$NAME_LIB
export EXAMP_LIB_INSTALL_DIR=$BUILD_LIB_DIR/lib_src

SRC_EXE_DIR=$SRCROOT/MainProject
BUILD_EXE_DIR=$SRC_EXE_DIR/build
NAME_EXE="hello"
export EXE_TARGET_NAME=$NAME_EXE
 #$SCRIPT_DIR/MyFancyResponderLib

#### THE LIBRARY BUILD ####
cd $SRC_LIB_DIR
mkdir -p $BUILD_LIB_DIR
cmake -B $BUILD_LIB_DIR -G Ninja .
ninja -C $BUILD_LIB_DIR $NAME_LIB
cmake --install build --prefix $TEST_INSTALL_DIR
cd ..

#### THE EXECUTABLE BUILD ####
cd $SRC_EXE_DIR
mkdir -p $BUILD_EXE_DIR
cmake -B $BUILD_EXE_DIR -G Ninja .
ninja -C $BUILD_EXE_DIR $NAME_EXE
# echo | pwd
cd $BUILD_EXE_DIR/hello_src/
./$NAME_EXE
cd ..
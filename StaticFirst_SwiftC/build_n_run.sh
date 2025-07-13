#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR
BUILDROOT=$SRCROOT/build

SRC_LIB_DIR=$SRCROOT/lib_src
BUILD_LIB_DIR=$BUILDROOT/lib
NAME_LIB="MyFancyResponseHandler"


SRC_EXE_DIR=$SRCROOT/hello_src
BUILD_EXE_DIR=$BUILDROOT/bin
NAME_EXE="hello"

# SWIFT_COMP=$(which swiftc)
mkdir -p $BUILDROOT
mkdir -p $BUILD_LIB_DIR
mkdir -p $BUILD_EXE_DIR
cd $BUILD_LIB_DIR
swiftc $SRC_LIB_DIR/Responder.swift -module-name $NAME_LIB -emit-module -emit-library -static
cd ..
cd $BUILD_EXE_DIR
swiftc $SRC_EXE_DIR/Hello.swift $SRC_EXE_DIR/Extra.swift \
 -parse-as-library \
 -L $BUILD_LIB_DIR -I $BUILD_LIB_DIR  -l$NAME_LIB \
 -o $BUILD_EXE_DIR/$NAME_EXE
cd ..
 # run it
cd $BUILD_EXE_DIR
./$NAME_EXE
cd ..

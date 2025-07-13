#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR
BUILDROOT=$SCRIPT_DIR/.build

PROJECT=hello
EXPECTED_EXECUTABLE=$BUILDROOT/$PROJECT

export PROJECT_NAME=$PROJECT

export LIBRARY_EXPORT_DIR=$SCRIPT_DIR/MyFancyResponderLib

#### THE BUILD ####
mkdir -p $BUILDROOT

## Must use ninja or xcode as generators if using swift mode
cmake -B $BUILDROOT -G Ninja .

## OPTION 1
## let cmake build what ninja generated
# cmake --build $BUILDROOT

## OPTION 2
# alternate to below, build with Ninja
ninja -C $BUILDROOT $PROJECT 

cd $BUILDROOT/hello_src
./$PROJECT
cd ..
#!/bin/bash
set -e

# GLEW version
VERSION="2.1.0"

# Build libs
cmake -G"Visual Studio 15 2017 Win64" . \
    -DCMAKE_C_FLAGS=" /Fd\"\$(TargetDir)\$(TargetName).pdb\""

cmake --build . -- //m //p:Configuration=Debug //v:minimal
cmake --build . -- //m //p:Configuration=Release //v:minimal

# Copy headers and libs
rm -rf build
mkdir -p build/native/include/GL build/native/lib
cp glew-$VERSION/include/GL/*.h build/native/include/GL
cp -R Debug Release build/native/lib

# Build nuget package
nuget pack glew-vc141-static-x64.nuspec -Version $VERSION

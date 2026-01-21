
# How to build for runtimecore

Update the version of compilers, cmake, and ninja in the scripts.

- OpenCV 4.13.0
- llvm 19.1.2
- CMake 4.2.1
- Ninja 1.12.1
- Xcode 16.2.0
- Visual Studio 2022 toolchain version 14.44.35207
- Windows SDK 10.0.19041.0

## linux

```bash
cd esri
./build_opencv_linux.sh
```

## macos

```bash
cd esri
./build_opencv_macos.sh
```

## windows

```bash
cd esri
./build_opencv_windows.sh
```

Copy the generated opencv zip file to the network shares

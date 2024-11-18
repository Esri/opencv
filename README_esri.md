
# How to build for runtimecore

Update the version of compilers, cmake, and ninja in the scripts.

- OpenCV 4.10.0
- llvm 19.1.2
- CMake 3.29.2
- Ninja 1.11.1
- Xcode 15.2.0
- Visual Studio toolchain version 14.38.33130
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

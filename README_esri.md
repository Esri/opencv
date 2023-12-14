
# How to build for runtimecore

Update the version of compilers, cmake, and ninja in the scripts.

- OpenCV 4.8.1
- llvm 17.0.1
- CMake 3.27.6
- Ninja 1.10.2
- Xcode 14.3.1
- Visual Studio toolchain version 14.37.32822
- Windows SDK 10.0.19041.0

## linux


```bash
$ cd esri
$ bash build_opencv_linux.sh
```

## macos

```bash
$ cd esri
$ bash build_opencv_macos.sh
```

## windows

```bash
$ cd esri
$ bash build_opencv_windows.sh
```

Zip the 4.8.1 directory to opencv-4.8.1.zip

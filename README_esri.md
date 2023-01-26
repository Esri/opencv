
# How to build for runtimecore

## linux

```bash
$ cd esri
$ docker build --tag=opencv:4.7.0 - < opencv.dockerfile
$ docker run --rm -it -u $(id -u):$(id -g) --volume ${HOME}/w/opencv:/opencv --workdir /opencv/esri opencv:4.7.0 bash
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

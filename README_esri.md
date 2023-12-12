
# How to build for runtimecore

## linux

```bash
$ cd esri
$ docker build --tag=opencv:4.8.1 - < opencv.dockerfile
```
For the following command, replace `/data/opencv` with the location of your opencv directory
```bash
$ docker run --rm -it -u $(id -u):$(id -g) --volume /data/opencv:/opencv --workdir /opencv/esri opencv:4.8.1 bash build_opencv_linux.sh
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

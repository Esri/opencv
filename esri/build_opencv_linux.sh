#!/usr/bin/env bash
set -ex

rm -rf build_arm64 build_x64

OPENCV_VERSION=4.13.0
PATH="/usr/local/rtc/cmake/4.2.1/bin:/usr/local/rtc/ninja/1.12.1/bin:$PATH"
export CCACHE_DIR=/tmp

if grep -q UBUNTU /etc/os-release; then
  cmake -S .. -B build_arm64 \
    -GNinja \
    -DCMAKE_C_COMPILER=/usr/bin/aarch64-linux-gnu-gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/aarch64-linux-gnu-g++ \
    -DCMAKE_C_COMPILER_TARGET=aarch64-unknown-linux-gnu \
    -DCMAKE_CXX_COMPILER_TARGET=aarch64-unknown-linux-gnu \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=install/${OPENCV_VERSION}/arm64 \
    -DENABLE_THIN_LTO=TRUE \
    -DOPENCV_PYTHON_SKIP_DETECTION=ON \
    -DWITH_FFMPEG=OFF \
    -DWITH_GTK=OFF \
    -DWITH_OPENCL=OFF \
    -DWITH_JPEG=OFF \
    -DWITH_JASPER=OFF \
    -DWITH_IPP=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_OPENJPEG=OFF \
    -DWITH_PNG=OFF \
    -DWITH_PROTOBUF=OFF \
    -DWITH_TIFF=OFF \
    -DWITH_WEBP=OFF \
    -DWITH_TBB=OFF \
    -DWITH_OPENMP=OFF \
    -DPARALLEL_ENABLE_PLUGINS=OFF \
    -DBUILD_ZLIB=ON \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_features2d=OFF \
    -DBUILD_opencv_flann=OFF \
    -DBUILD_opencv_core=ON \
    -DBUILD_opencv_imgcodecs=OFF \
    -DBUILD_opencv_imgproc=ON \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_calib3d=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_features2d=OFF \
    -DBUILD_opencv_flann=OFF \
    -DBUILD_opencv_gapi=OFF \
    -DBUILD_opencv_highgui=OFF \
    -DBUILD_opencv_java_bindings_generator=OFF \
    -DBUILD_opencv_js=OFF \
    -DBUILD_opencv_js_bindings_generator=OFF \
    -DBUILD_opencv_ml=OFF \
    -DBUILD_opencv_objc_bindings_generator=OFF \
    -DBUILD_opencv_objdetect=OFF \
    -DBUILD_opencv_photo=OFF \
    -DBUILD_opencv_python_bindings_generator=OFF \
    -DBUILD_opencv_python_tests=OFF \
    -DBUILD_opencv_stitching=OFF \
    -DBUILD_opencv_ts=OFF \
    -DBUILD_opencv_video=OFF \
    -DBUILD_opencv_videoio=OFF \
    -DBUILD_opencv_world=OFF
  cmake --build build_arm64 -t install
fi

if grep -q REDHAT /etc/os-release; then
  cmake -S .. -B build_x64 \
    -GNinja \
    -DCMAKE_C_COMPILER_TARGET=x86_64-unknown-linux-gnu \
    -DCMAKE_CXX_COMPILER_TARGET=x86_64-unknown-linux-gnu \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=install/${OPENCV_VERSION}/x64 \
    -DENABLE_THIN_LTO=TRUE \
    -DOPENCV_PYTHON_SKIP_DETECTION=ON \
    -DWITH_FFMPEG=OFF \
    -DWITH_GTK=OFF \
    -DWITH_OPENCL=OFF \
    -DWITH_JPEG=OFF \
    -DWITH_JASPER=OFF \
    -DWITH_IPP=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_OPENJPEG=OFF \
    -DWITH_PNG=OFF \
    -DWITH_PROTOBUF=OFF \
    -DWITH_TIFF=OFF \
    -DWITH_WEBP=OFF \
    -DWITH_TBB=OFF \
    -DWITH_OPENMP=OFF \
    -DPARALLEL_ENABLE_PLUGINS=OFF \
    -DBUILD_ZLIB=ON \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_features2d=OFF \
    -DBUILD_opencv_flann=OFF \
    -DBUILD_opencv_core=ON \
    -DBUILD_opencv_imgcodecs=OFF \
    -DBUILD_opencv_imgproc=ON \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_calib3d=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_features2d=OFF \
    -DBUILD_opencv_flann=OFF \
    -DBUILD_opencv_gapi=OFF \
    -DBUILD_opencv_highgui=OFF \
    -DBUILD_opencv_java_bindings_generator=OFF \
    -DBUILD_opencv_js=OFF \
    -DBUILD_opencv_js_bindings_generator=OFF \
    -DBUILD_opencv_ml=OFF \
    -DBUILD_opencv_objc_bindings_generator=OFF \
    -DBUILD_opencv_objdetect=OFF \
    -DBUILD_opencv_photo=OFF \
    -DBUILD_opencv_python_bindings_generator=OFF \
    -DBUILD_opencv_python_tests=OFF \
    -DBUILD_opencv_stitching=OFF \
    -DBUILD_opencv_ts=OFF \
    -DBUILD_opencv_video=OFF \
    -DBUILD_opencv_videoio=OFF \
    -DBUILD_opencv_world=OFF
  cmake --build build_x64 -t install
fi

# at this point, you can zip the installer with both builds included on your host using:
# zip -r ../opencv-${OPENCV_VERSION}.zip ${OPENCV_VERSION}

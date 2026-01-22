#!/usr/bin/env bash
set -ex

# Building universal binaries is no longer supported in OpenCV. Build both architectures separately and package them
# together instead.
# https://github.com/opencv/opencv/issues/28187
if [ "$(uname -m)" != "arm64" ]; then
  echo "This script must be using an Apple Silicon Mac to cross-compile."
  exit 1
fi

rm -rf build_arm64 build_x64
rm -rf install
rm -f opencv-*.zip

OPENCV_VERSION=4.13.0
export DEVELOPER_DIR="/Applications/Xcode_16.2.0.app/Contents/Developer"
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
PATH="/usr/local/rtc/cmake/4.2.1/bin:/usr/local/rtc/ninja/1.12.1/bin:$PATH"

cmake -S .. -B build_arm64 \
  -GNinja \
  -DCMAKE_OSX_ARCHITECTURES="arm64" \
  -DCMAKE_SYSTEM_PROCESSOR="arm64" \
  -DCMAKE_OSX_DEPLOYMENT_TARGET="14.0" \
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

arch -x86_64 cmake -S .. -B build_x64 \
  -GNinja \
  -DCMAKE_OSX_ARCHITECTURES="x86_64" \
  -DCMAKE_SYSTEM_PROCESSOR="x86_64" \
  -DCMAKE_OSX_DEPLOYMENT_TARGET="14.0" \
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

cd install
zip -r ../opencv-${OPENCV_VERSION}.zip ${OPENCV_VERSION}

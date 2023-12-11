
set -ex

rm -rf build
rm -rf install

mkdir build
cd build

export DEVELOPER_DIR="/Applications/Xcode_13.2.1.app/Contents/Developer"
export CXX="/usr/bin/clang++"
PATH="/usr/local/rtc/cmake/3.22.0/bin:/usr/local/rtc/ninja/1.10.2/bin:$PATH"

cmake -S ../.. -B build \
  -GNinja \
  -DCMAKE_OSX_ARCHITECTURES="arm64;x86_64" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=install \
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
cmake --build build -t install

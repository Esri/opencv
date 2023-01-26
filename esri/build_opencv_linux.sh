
set -ex

rm -rf build
rm -rf install

mkdir build
cd build
cmake \
  -GNinja \
  -DCMAKE_C_COMPILER=/usr/local/rtc/llvm/11.0.0/bin/clang \
  -DCMAKE_CXX_COMPILER=/usr/local/rtc/llvm/11.0.0/bin/clang++ \
  -DCMAKE_C_FLAGS="-m64" \
  -DCMAKE_CXX_FLAGS="-m64 -stdlib=libc++" \
  -DCMAKE_SHARED_LINKER_FLAGS="-stdlib=libc++ -static-libstdc++ -fuse-ld=lld -rtlib=compiler-rt -ldl -pthread" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=../install \
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
  -DBUILD_opencv_world=OFF \
  ../..
ninja install

OPENCV_VERSION=4.8.1

function cmake_configure
{
  cmake \
    -G "Visual Studio 17 2022" \
    -T "version=14.37.32822" \
    -DCMAKE_SYSTEM_VERSION=10.0.19041.0 \
    -DCMAKE_INSTALL_PREFIX=do_not_install_here \
    -DOPENCV_PYTHON_SKIP_DETECTION=ON \
    -DWITH_FFMPEG=OFF \
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
    -DBUILD_opencv_world=OFF \
    "$@"
}

set -ex

rm -rf build

mkdir build
cd build

rm -rf build_x64
rm -rf install_x64

cmake_configure -S ../.. -B build_x64 -A x64
cmake --build build_x64 --config Debug
cmake --build build_x64 --config Release
cmake --install build_x64 --config Debug --prefix install_x64
cmake --install build_x64 --config Release --prefix install_x64

rm -rf build_x86
rm -rf install_x86
cmake_configure -S ../.. -B build_x86 \
    -A Win32 \
    -DCMAKE_SYSTEM_NAME=Windows \
    -DCMAKE_SYSTEM_VERSION=10.0 \
    -DCMAKE_SYSTEM_PROCESSOR=x86
cmake --build build_x86 --config Debug
cmake --build build_x86 --config Release
cmake --install build_x86 --config Debug --prefix install_x86
cmake --install build_x86 --config Release --prefix install_x86

rm -rf build_arm64
rm -rf install_arm64
cmake_configure -S ../.. -B build_arm64 \
    -A ARM64 \
    -DCMAKE_SYSTEM_NAME=Windows \
    -DCMAKE_SYSTEM_VERSION=10.0 \
    -DCMAKE_SYSTEM_PROCESSOR=ARM64
cmake --build build_arm64 --config Debug
cmake --build build_arm64 --config Release
cmake --install build_arm64 --config Debug --prefix install_arm64
cmake --install build_arm64 --config Release --prefix install_arm64

cd ..

rm -rf ${OPENCV_VERSION}
mkdir ${OPENCV_VERSION}
cp -r build/install_x64/* ${OPENCV_VERSION}
cp -r build/install_x86/x86 ${OPENCV_VERSION}/x86
cp -r build/install_arm64/ARM64 ${OPENCV_VERSION}/ARM64

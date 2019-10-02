mkdir -p build
cd build

cmake \
        -G "${CMAKE_GENERATOR}" \
	-DCMAKE_INSTALL_PREFIX="${PREFIX}" \
	-DCMAKE_PREFIX_PATH="${PREFIX}" \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_PYTHON_BINDINGS=ON \
	-DBUILD_CLI_EXECUTABLES=ON \
	-DBUILD_SHARED_LIBRARIES=ON \
	-DBUILD_TESTS=OFF \
	-DMATLAB_BINDINGS=OFF \
	-DDOWNLOAD_STB_IMAGE=OFF \
	-DDOWNLOAD_ENSMALLEN=OFF \
	-DPYTHON_EXECUTABLE=${PYTHON} \
	-DUSE_OPENMP=ON \
	-DENSMALLEN_INCLUDE_DIR=$PREFIX/include \
	-DARMADILLO_INCLUDE_DIR=$PREFIX/include \
	-DARMADILLO_LIBRARY=$PREFIX/lib \
	-DBoost_NO_BOOST_CMAKE=1 \
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
	..

make -j${CPU_COUNT}
make install

#	-DBOOST_INCLUDEDIR=$PREFIX/include \
#	-DBoost_NO_SYSTEM_PATHS=ON \
#	-DBOOST_LIBRARYDIR=$PREFIX/lib \
#	-DBOOST_ROOT=$PREFIX \

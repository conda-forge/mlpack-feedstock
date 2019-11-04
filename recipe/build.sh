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
	-DPYTHON_EXECUTABLE="${PYTHON}" \
	-DUSE_OPENMP=ON \
	-DENSMALLEN_INCLUDE_DIR="${PREFIX}/include" \
	-DARMADILLO_INCLUDE_DIR="${PREFIX}/include" \
	-DARMADILLO_LIBRARY="${PREFIX}/lib/libarmadillo.so" \
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true \
	-DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 \
	-DCMAKE_INSTALL_LIBDIR=lib \
	..

make -j${CPU_COUNT}
make install


# Workaround as the python symbols are in ``libmlpack.so`` located in ``lib``
ln -s ${PREFIX}/lib/libmlpack.so ${SP_DIR}/libmlpack.so


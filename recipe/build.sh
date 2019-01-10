mkdir -p build
cd build

cmake \
        -G "${CMAKE_GENERATOR}" \
        -DCMAKE_PREFIX_PATH:PATH="${PREFIX}" \
	-DBUILD_PYTHON_BINDINGS=ON \
	-DBUILD_CLI_EXECUTABLES=ON \
	-DBUILD_SHARED_LIBRARIES=ON \
	-DFORCE_CXX11=ON \
	-DBUILD_TESTS=OFF \
        -DBOOST_INCLUDEDIR="${PREFIX}/include" \
        -DBOOST_LIBRARYDIR="${PREFIX}/lib" \
        -DBOOST_ROOT="${PREFIX}" \
	-DUSE_OPENMP=OFF \
	..

make -j${CPU_COUNT} VERBOSE=1
make install

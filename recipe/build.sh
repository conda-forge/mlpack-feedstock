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
        -DDOWNLOAD_DEPENDENCIES=OFF \
        -DPYTHON_EXECUTABLE="${PYTHON}" \
        -DUSE_OPENMP=ON \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true \
        ..

make -j${CPU_COUNT}
make install

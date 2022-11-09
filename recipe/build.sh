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
        -DBUILD_TESTS=ON \
        -DDOWNLOAD_DEPENDENCIES=ON \
        -DPYTHON_EXECUTABLE="${PYTHON}" \
        -DUSE_OPENMP=ON \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true \
        -DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 \
        ..

make -j${CPU_COUNT}

echo ""
echo "import mlpack test"
echo ""
cd src/mlpack/bindings/python/
${PYTHON} -c "import mlpack; import numpy as np; x = np.random.rand(100, 10); o = mlpack.pca(input_=x, new_dimensionality=5, verbose=True)"
cd ../../../../

echo ""
echo "attempt install"
echo ""
make install

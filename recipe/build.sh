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
python -c "import mlpack"
cd ../../../../

echo ""
echo "list binding directory"
echo ""
ls -lh src/mlpack/bindings/python/mlpack/

# Try running the test by hand.
echo ""
echo "run the tests"
echo ""
cd src/mlpack/bindings/python/
NO_BUILD=1 python setup.py test
cd ../../../../

echo ""
echo "run the tests via ctest"
echo ""
CTEST_OUTPUT_ON_FAILURE=1 ctest .
make install

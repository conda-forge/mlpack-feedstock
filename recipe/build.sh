mkdir build
cd build

cmake \
        -G "${CMAKE_GENERATOR}" \
	-DCMAKE_INSTALL_PREFIX="${PREFIX}" \
	-DCMAKE_PREFIX_PATH="${PREFIX}" \
	-DBUILD_PYTHON_BINDINGS=ON \
	-DBUILD_CLI_EXECUTABLES=ON \
	-DBUILD_SHARED_LIBRARIES=ON \
	-DFORCE_CXX11=OFF \
        -DBUILD_TESTS=OFF \
	-Dmlpack_ARMA_DONT_USE_OPENMP=ON \ 
	../

make -j${CPU_COUNT}
make install

mkdir build
cd build

cmake %SRC_DIR% -G "Ninja" ^
      --trace-expand
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE="Release" ^
      -DBUILD_PYTHON_BINDINGS=ON ^
      -DBUILD_CLI_EXECUTABLES=ON ^
      -DBUILD_SHARED_LIBS=OFF ^
      -DBUILD_TESTS=OFF ^
      -DMATLAB_BINDINGS=OFF ^
      -DDOWNLOAD_STB_IMAGE=OFF ^
      -DDOWNLOAD_ENSMALLEN=OFF ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      -DUSE_OPENMP=ON ^
      -DCMAKE_CXX_COMPILER=cl.exe ^
      -DCMAKE_C_COMPILER=cl.exe ^
      -DBoost_INCLUDE_DIRS=%LIBRARY_PREFIX%/include ^
      -DBoost_USE_STATIC_LIBS=ON ^
      -DBoost_USE_STATIC_RUNTIME=ON ^
      -DENSMALLEN_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_LIBRARIES="%LIBRARY_PREFIX%/lib/armadillo.lib" ^
      -D_ARMA_SUPPORT_LIBRARIES="%LIBRARY_PREFIX%/lib/openblas.lib" ^
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true ^
      -DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DBoost_LIB_DIAGNOSTIC_DEFINITIONS=1 ^
      ..

cmake --build . --target install --config Release

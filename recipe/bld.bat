mkdir build
cd build

cmake %SRC_DIR% -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE="Release" ^
      -DBUILD_PYTHON_BINDINGS=ON ^
      -DBUILD_CLI_EXECUTABLES=ON ^
      -DBUILD_SHARED_LIBS=ON ^
      -DBUILD_TESTS=OFF ^
      -DMATLAB_BINDINGS=OFF ^
      -DDOWNLOAD_STB_IMAGE=OFF ^
      -DDOWNLOAD_ENSMALLEN=OFF ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      -DUSE_OPENMP=ON ^
      -DBoost_INCLUDE_DIRS=%LIBRARY_PREFIX%/include ^
      -DBoost_USE_STATIC_LIBS=OFF ^
      -DBoost_USE_STATIC_RUNTIME=OFF ^
      -DENSMALLEN_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_LIBRARIES="%LIBRARY_PREFIX%/lib/armadillo.lib" ^
      -D_ARMA_SUPPORT_LIBRARIES="%LIBRARY_PREFIX%/lib/openblas.lib" ^
      -DARMA_EXTRA_DEBUG=OFF ^
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true ^
      -DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
      ..

ls %LIBRARY_PREFIX%/lib
cmake --build . --target install --config Release

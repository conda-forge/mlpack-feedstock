mkdir build
cd build
echo %PREFIX%\Library\include
dir %PREFIX%\Library\include

cmake %SRC_DIR% -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DBUILD_PYTHON_BINDINGS=ON ^
    -DBUILD_CLI_EXECUTABLES=ON ^
    -DBUILD_SHARED_LIBS=ON ^
    -DBUILD_TESTS=OFF ^
`   -DDOWNLOAD_DEPENDENCIES=OFF ^
    -DCEREAL_INCLUDE_DIR=%PREFIX%\Library\include ^
    -DUSE_OPENMP=OFF ^
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true ^
    -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
    ..

cmake --build . --target install --config Release -j1

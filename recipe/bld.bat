if "%ARCH%"=="64" (
    call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86_amd64
)


mkdir build
cd build

set UNIX_PREFIX=%PREFIX:\=/%
set UNIX_LIBRARY_PREFIX=%LIBRARY_PREFIX:\=/%
set UNIX_LIBRARY_BIN=%LIBRARY_BIN:\=/%
set UNIX_LIBRARY_INC=%LIBRARY_INC:\=/%
set UNIX_LIBRARY_LIB=%LIBRARY_LIB:\=/%
set UNIX_SP_DIR=%SP_DIR:\=/%
set UNIX_SRC_DIR=%SRC_DIR:\=/%

cmake -G "${CMAKE_GENERATOR}"                                                               ^
	-DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX%                                            ^
	-DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX%                                               ^
	-DCMAKE_BUILD_TYPE=Release                                                              ^
	-DBUILD_PYTHON_BINDINGS=ON                                                              ^
	-DBUILD_CLI_EXECUTABLES=ON                                                              ^
	-DBUILD_SHARED_LIBRARIES=ON                                                             ^
	-DBUILD_TESTS=OFF                                                                       ^
	-DMATLAB_BINDINGS=OFF                                                                   ^
	-DDOWNLOAD_STB_IMAGE=OFF                                                                ^
	-DDOWNLOAD_ENSMALLEN=OFF                                                                ^
	-DPYTHON_EXECUTABLE=%UNIX_PREFIX%/python                                                ^
	-DUSE_OPENMP=ON                                                                         ^
	-DENSMALLEN_INCLUDE_DIR=%UNIX_PREFIX%/ensmallen/include                                 ^
	-DARMADILLO_INCLUDE_DIR=%UNIX_PREFIX%/armadillo/include                                 ^
	-DARMADILLO_LIBRARY=%UNIX_PREFIX%/armadillolib/libarmadillo.so                          ^
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \                                                      ^
	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true \                                              ^
	-DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 \                                      ^
	-DCMAKE_INSTALL_LIBDIR=lib \                                                            ^
	..                                                                                      ^


if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

exit 0
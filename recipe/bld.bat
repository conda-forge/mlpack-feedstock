mkdir -p build
pushd build

set UNIX_PREFIX=%PREFIX:\=/%
set UNIX_LIBRARY_PREFIX=%LIBRARY_PREFIX:\=/%

cmake -G "Ninja"                                                                            ^
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
	-DARMADILLO_LIBRARY=%UNIX_PREFIX%/armadillo/lib/libarmadillo.so                         ^
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON                                                        ^
	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true                                                ^
	-DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000                                        ^
	-DCMAKE_INSTALL_LIBDIR=lib                                                              ^
	..                                                                                      ^


ninja
ninja install
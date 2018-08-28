#!/bin/bash

# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

set -ex

SCRIPTDIR=$(dirname "$0")
cd $SCRIPTDIR/../..

mkdir build && cd build

# TODO remove -DMPI_* variables once these get auto-detected
# Note that -DMODE alone decides whether MPI is used or not.
CC=gcc FC=gfortran cmake -G "MSYS Makefiles" \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=install -DWRF_DIR=../../WRF/build \
    -DENABLE_GRIB1=${GRIB1} -DENABLE_GRIB2_PNG=${GRIB2} -DENABLE_GRIB2_JPEG2000=${GRIB2} \
    -DMPI_INCLUDE_PATH=$MINGW_PREFIX/include -DMPI_C_LIBRARY="$MSMPI_LIB64/msmpi.lib" \
    -DMPI_Fortran_LIBRARY="$MSMPI_LIB64/msmpifec.lib" ..

cmake --build . --target install -- -j2
# WRF-CMake (https://github.com/WRF-CMake/wps).
# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

add_subdirectory(src)

install(FILES
    METGRID.TBL.ARW
    DESTINATION metgrid)

install(FILES METGRID.TBL.ARW DESTINATION metgrid RENAME METGRID.TBL)
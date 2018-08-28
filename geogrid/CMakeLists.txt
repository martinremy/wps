# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

add_subdirectory(src)

install(FILES
    GEOGRID.TBL.ARW
    DESTINATION geogrid)

install(FILES GEOGRID.TBL.ARW DESTINATION geogrid RENAME GEOGRID.TBL)
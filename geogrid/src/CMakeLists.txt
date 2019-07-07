# WRF-CMake (https://github.com/WRF-CMake/wps).
# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

add_definitions(-D_GEOGRID)

add_executable(geogrid
    "${UNGRIB_SRC}/module_stringutil.F"
    bitarray_module.F
    cio.c
    constants_module.F
    geogrid.F
    gridinfo_module.F
    hash_module.F
    interp_module.F
    list_module.F
    llxy_module.F
    misc_definitions_module.F
    module_debug.F
    module_map_utils.F
    output_module.F
    parallel_module.F
    proc_point_module.F
    process_tile_module.F
    queue_module.F
    read_geogrid.c
    smooth_module.F
    source_data_module.F
    wrf_debug.F
)

set_property(TARGET geogrid PROPERTY Fortran_FORMAT FREE)

target_link_libraries(geogrid
    WRF::frame
)

target_include_directories(geogrid PRIVATE
    ${IO_GRIB_SHARE_INCLUDE_DIR}
)

wps_enable_mpi(geogrid Fortran)

install( TARGETS geogrid
    RUNTIME DESTINATION .
)
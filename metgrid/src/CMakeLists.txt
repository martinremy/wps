# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

add_definitions(-D_METGRID)

if (ENABLE_NETCDF)
    include_directories(
        ${NETCDF_F90_INCLUDE_DIR}
    )
endif()

add_executable(metgrid
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/wrf_debug.F"
    "${GEOGRID_SRC}/bitarray_module.F"
    "${GEOGRID_SRC}/constants_module.F"
    "${GEOGRID_SRC}/interp_module.F"
    "${GEOGRID_SRC}/list_module.F"
    "${GEOGRID_SRC}/llxy_module.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/module_map_utils.F"
    "${GEOGRID_SRC}/output_module.F"
    "${GEOGRID_SRC}/parallel_module.F"
    "${GEOGRID_SRC}/queue_module.F"
    "${UNGRIB_SRC}/module_stringutil.F"
    datatype_module.F
    gridinfo_module.F
    metgrid.F
    input_module.F
    interp_option_module.F
    met_data_module.F
    minheap_module.F
    module_date_pack.F
    module_mergesort.F
    process_domain_module.F
    read_met_module.F
    rotate_winds_module.F
    storage_module.F
    write_met_module.F
    scan_input.F
    mpas_mesh.F
    target_mesh.F
    remapper.F
)

set_property(TARGET metgrid PROPERTY Fortran_FORMAT FREE)

target_link_libraries(metgrid
    WRF::frame
)

if (ENABLE_NETCDF)
    target_link_libraries(metgrid
        ${NETCDF_LIBRARIES}
    )
endif()

target_include_directories(metgrid PRIVATE
    ${IO_GRIB_SHARE_INCLUDE_DIR}
)

wps_enable_mpi(metgrid Fortran)

install(TARGETS metgrid
    RUNTIME DESTINATION .
)
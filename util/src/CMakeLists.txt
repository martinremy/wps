# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

# The plotgrids and plotfmt executables are omitted here as they depend
# on the ncarg library (NCAR Graphics) which does not run on Windows.

add_executable(rd_intermediate
    rd_intermediate.F
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/constants_module.F"
    "${METGRID_SRC}/read_met_module.F"
    "${METGRID_SRC}/met_data_module.F"
)

add_executable(avg_tsfc
    avg_tsfc.F
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/constants_module.F"
    "${METGRID_SRC}/gridinfo_module.F"
    "${METGRID_SRC}/read_met_module.F"
    "${METGRID_SRC}/write_met_module.F"
    "${METGRID_SRC}/module_date_pack.F"
    "${METGRID_SRC}/met_data_module.F"
)

add_executable(elev_angle
   elev_angle.F
   "${GEOGRID_SRC}/cio.c"
   "${GEOGRID_SRC}/module_debug.F"
   "${GEOGRID_SRC}/misc_definitions_module.F"
   "${METGRID_SRC}/gridinfo_module.F"
   "${METGRID_SRC}/write_met_module.F"
   "${METGRID_SRC}/met_data_module.F"
)

target_include_directories(elev_angle
   PRIVATE ${NETCDF_F77_INCLUDE_DIR}
)

target_link_libraries(elev_angle
   ${NETCDF_LIBRARIES}
)

add_executable(calc_ecmwf_p
    calc_ecmwf_p.F
    "${UNGRIB_SRC}/module_stringutil.F"
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/constants_module.F"
    "${METGRID_SRC}/gridinfo_module.F"
    "${METGRID_SRC}/read_met_module.F"
    "${METGRID_SRC}/write_met_module.F"
    "${METGRID_SRC}/module_date_pack.F"
    "${METGRID_SRC}/met_data_module.F"
)

add_executable(mod_levs
    mod_levs.F
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/constants_module.F"
    "${METGRID_SRC}/read_met_module.F"
    "${METGRID_SRC}/write_met_module.F"
    "${METGRID_SRC}/met_data_module.F"
)

add_executable(int2nc
    int2nc.F
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/cio.c"
    "${METGRID_SRC}/read_met_module.F"
)

target_include_directories(int2nc
    PRIVATE ${NETCDF_F77_INCLUDE_DIR}
)

target_link_libraries(int2nc
    ${NETCDF_LIBRARIES}
)

add_executable(height_ukmo
    height_ukmo.F
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/constants_module.F"
    "${METGRID_SRC}/gridinfo_module.F"
    "${METGRID_SRC}/read_met_module.F"
    "${METGRID_SRC}/write_met_module.F"
    "${METGRID_SRC}/module_date_pack.F"
    "${METGRID_SRC}/met_data_module.F"
)

set(utils
    rd_intermediate
    avg_tsfc
    elev_angle
    calc_ecmwf_p
    mod_levs
    int2nc
    height_ukmo
)

set_property(
    TARGET ${utils}
    PROPERTY Fortran_FORMAT FREE)

install(TARGETS ${utils}
    RUNTIME DESTINATION .
)
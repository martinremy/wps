# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

# The plotgrids and plotfmt executables are omitted here as they depend
# on the ncarg library (NCAR Graphics) which does not run on Windows.

# .mod files are by default created in the same CMAKE_CURRENT_BINARY_DIR folder.
# Even though we don't use the .mod files it leads to deletion/copying issues if
# parallel compilation is enabled that are caused by race conditions. E.g.:
# "Can't rename module file 'misc_definitions_module.mod0' to 'misc_definitions_module.mod': No such file or directory"
# Here we set a separate .mod folder for each executable to avoid such problems.

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/rd_intermediate)
add_executable(rd_intermediate
    rd_intermediate.F
    "${GEOGRID_SRC}/module_debug.F"
    "${GEOGRID_SRC}/misc_definitions_module.F"
    "${GEOGRID_SRC}/cio.c"
    "${GEOGRID_SRC}/constants_module.F"
    "${METGRID_SRC}/read_met_module.F"
    "${METGRID_SRC}/met_data_module.F"
)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/avg_tsfc)
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

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/elev_angle)
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

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/calc_ecmwf_p)
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

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/mod_levs)
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

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/int2nc)
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

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod/height_ukmo)
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
# WRF-CMake (https://github.com/WRF-CMake/wps).
# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

if (APPLE)
	add_definitions(-DMACOS)
endif()

add_definitions(-D__64BIT__)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod)

add_library(g2 STATIC
	addfield.F
	addgrid.f
	addlocal.f
	comunpack.f
	dec_jpeg2000.c
	dec_png.c
	drstemplates.f
	g2grids.f
	gb_info.f
	gbytesc.f
	gdt2gds.f
	getdim.f
	getfield.f
	getg2i.f
	getg2ir.f
	getgb2.f
	getgb2l.f
	getgb2p.f
	getgb2r.f
	getgb2rp.f
	getgb2s.f
	getidx.f
	getlocal.f
	getpoly.f
	gettemplates.f
	gf_free.f
	gf_getfld.f
	gf_unpack1.f
	gf_unpack2.f
	gf_unpack3.f
	gf_unpack4.f
	gf_unpack5.f
	gf_unpack6.f
	gf_unpack7.F
	gribcreate.f
	gribend.f
	gribinfo.f
	gribmod.f
	gridtemplates.f
	intmath.f
	ixgb2.f
	jpcunpack.F
	mkieee.f
	mova2i.c
    params_ecmwf.f
    params.f
	pdstemplates.f
	pngunpack.F
    putgb2.f
	rdieee.f
	realloc.f
	reduce.f
	simunpack.f
	skgb.f
	specunpack.f
	#../w3/baciof.f       # FIXME: these are the files needed to complete the compilation of the g2
	#../w3/r63w72.f			# library using dynamic linking. For now I have commented these files out and
	#../w3/w3fi71.f				# use static linking instead. Note that therefore g2 has dependency on w3
	#../w3/bacio.v1.3.c
)

set_property(TARGET g2 PROPERTY Fortran_FORMAT FIXED)

target_link_libraries(g2
	${GRIB2_COMPRESSION_LIBRARIES}
)

target_include_directories(g2
	INTERFACE ${CMAKE_Fortran_MODULE_DIRECTORY}
)

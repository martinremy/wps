# Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.

# See https://gitlab.kitware.com/cmake/cmake/issues/17989 for why this code is in a separate file/folder.

if (WIN32)
	set(apps
		"\${CMAKE_INSTALL_PREFIX}/geogrid.exe"
		"\${CMAKE_INSTALL_PREFIX}/ungrib.exe"
		"\${CMAKE_INSTALL_PREFIX}/metgrid.exe"
		)

	# This copies all necessary DLLs next to the executables.
	foreach (app ${apps})
		install(CODE "
			include(BundleUtilities)
			fixup_bundle(\"${app}\" \"\" \"\")
			" COMPONENT Runtime)
	endforeach()
endif()

# TODO For macOS, try delocate-path (https://github.com/matthew-brett/delocate)
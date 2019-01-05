# WPS-CMake [![Build status](https://ci.appveyor.com/api/projects/status/8axylclvn10h32kk/branch/wps-cmake?svg=true)](https://ci.appveyor.com/project/WRF-CMake/wps/branch/wps-cmake) [![Build Status](https://travis-ci.com/WRF-CMake/WPS.svg?branch=wps-cmake)](https://travis-ci.com/WRF-CMake/WPS)

WPS-CMake adds CMake support to the latest version of the [Advanced Research Weather Research and Forecasting](https://www.mmm.ucar.edu/weather-research-and-forecasting-model) model with the intention of streamlining and simplifying its configuration and build process. In our view, the use of CMake provides model developers, code maintainers, and end-users with several advantages such as robust incremental rebuilds, flexible library dependency discovery, native tool-chains for Windows, macOS, and Linux with minimal external dependencies, thus increasing portability, and automatic generation of project files for different platforms.

## Download pre-built binaries [Experimental]
We currently provide WRF-CMake and WPS-CMake pre-built binary distributions for Windows, macOS and Linux ([RPM-based and Debian-based distribution-compatible](https://en.wikipedia.org/wiki/List_of_Linux_distributions)). Please note that these pre-built binary distributions are currently experimental — we would appreciate if you could report any issues directly on GitHub [here](https://github.com/WRF-CMake/WPS/issues).
To download the latest pre-compiled binary-releases, please see the following links WRF-CMake and WPS-CMake respectively:

- WRF-CMake (`serial` and `dmpar`): [https://github.com/WRF-CMake/WRF/releases](https://github.com/WRF-CMake/WRF/releases).
- WPS-CMake (`serial` and `dmpar`): [https://github.com/WRF-CMake/WPS/releases](https://github.com/WRF-CMake/WPS/releases).

Note that if you want to launch WRF-CMake and WPS-CMake built in `dmpar` to run on multiple processes, you need to have MPI installed on your system.

- On Windows, download and install Microsoft MPI — download and install `msmpisetup.exe` from [https://www.microsoft.com/en-us/download/details.aspx?id=56727](https://www.microsoft.com/en-us/download/details.aspx?id=56727).
- On macOS you can get it though [Homebrew](https://brew.sh/) using `brew update && brew install mpich`
- On Linux, use your package manager to download mpich. E.g. `sudo apt install mpich` on Debian-based systems or `sudo yum install mpich` on RPM-based system like CentOS.

## Build from source
If you want to know how to install WRF-CMake and WPS-CMake from source please refer the [WRF-CMake page](https://github.com/WRF-CMake/WRF#readme).

## Changes to be upstreamed
- `metgrid/src/{read,write}_met_module.F`, `ungrib/src/{datint,output,rrpr,ungrib}.F`: Replace colons with underscores in filenames to be compatible with Windows
- `ungrib/src/cio.c`, `ungrib/src/ngl/w3/bacio.v1.3.c`: Fixed file opening on Windows which is text-mode by default and has been changed to binary mode
- `util/src/elev_angle.F`: Establish compatibility with modern compilers by moving subroutines into module
- `util/src/elev_angle.F`: Add support for compilers that define `iargc` as 'intrinsic' instead of 'external'
- `util/src/elev_angle.F`: Fixed ordering of argument declarations to avoid Cray compile errors

## Copyright and license
General WRF copyright and license applies for any files part of the original WPS distribution — see the [README](README) file for more details.

Additional files provided by WPS-CMake are licensed according to [LICENSE_CMAKE.txt](LICENSE_CMAKE.txt) if the relevant file contains the following header at the beginning of the file, otherwise the general WRF copyright and license applies.
```
Copyright 2018 M. Riechert and D. Meyer. Licensed under the MIT License.
```

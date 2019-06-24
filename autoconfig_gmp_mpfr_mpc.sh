#!/bin/sh
# Authors:
#   Madalin Cherciu <cherciumadalin@gmail.com>
#
# Description:
#   A configuration/compilation and installation bash script of GMP, MPFR and MPC.
#   The user has to specify only the accordingly paths for GMP, MPFR and MPC folders. 
#   
# P.S. I use it for gcc specific version compilation
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

echo -e "Please specify the path for GMP ..."
read p1
echo -e "Please specify the path for MPFR ..."
read p2
echo -e "Please specify the path for MPC ..."
read p3
echo "Compiling time ..."
echo "GMP compilling ..."
cd $p1
./configure --prefix=${PWD} --disable-shared --enable-static
make && make check && make install
echo "MPFR compilling ..."
cd $p2
./configure --prefix=${PWD} --disable-shared --enable-static --with-gmp-lib=$p1/lib
make && make check && make install
echo "MPC compilling ..."
cd $p3
./configure --prefix=${PWD} --disable-shared --enable-static --with-gmp-lib=$p1/lib --with-mpfr-lib=$p2/lib
make && make check && make install
echo "DONE ..."

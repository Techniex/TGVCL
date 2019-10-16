#!/bin/bash
#----------------------------------------------------------------------#
# TGVCL: Techniex Generic VHDL Code Library                            #
# GHDL Templet script: 2019, https://techniex.com                      #
#----------------------------------------------------------------------#
#! @file runghdl.sh                                                    #
#                                                                      #
#! @brief This script runs the GHDL simulation.                        #
#                                                                      #
#! @author Purnendu Kumar <purnendu.tx@gmail.com>                      #
#                                                                      #
#! @date 16/10/2019                                                    #
#                                                                      #
#! @details \n                                                         #
#! This script (runghdl.sh) is part of VHDL repository being developed #
#! by https://techniex.com for training and reference purposes. This   #
#! script is meant to run the simulation of source codes using GHDL.\n #
#! Sequence : \n                                                       #
#! 1. Edit parameters below in user action section as per need. \n     #
#! 2. Parameters display. \n                                           #
#! 3. Syntax Check. \n                                                 #
#! 4. Design Analysis. \n                                              #
#! 5. Design Elaboration. \n                                           #
#! 4. Design Execution. \n                                             #
#! 5. Launch GTKWave is specified in parameters. \n                    #
#! * Script will exit at stage where it finds first error without ex-  #
#! ecuting further steps.                                              #
#                                                                      #
#! @references https://ghdl.readthedocs.io/en/latest/index.html        #
#----------------------------------------------------------------------#
#! @note \n                                                            #
#! To give executable permission please run following command first. \n#
#! chmod +x runghdl.sh                                                 #
# ---------------------------------------------------------------------#
#! @licence GNU-GPL version 3 \n                                       #
#                                                                      #
# runghdl.sh is free software: you can redistribute it and/or modify   #
# it under the terms of the GNU General Public License as published by #
# the Free Software Foundation, either version 3 of the License, or    #
# (at your option) any later version.                                  #
#                                                                      #
# This program is distributed in the hope that it will be useful,      #
# but WITHOUT ANY WARRANTY; without even the implied warranty of       #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        #
# GNU General Public License for more details.                         #
#                                                                      #
# You should have received a copy of the GNU General Public License    #
# along with this program. If not, see <https://www.gnu.org/licenses/>.# 
# ---------------------------------------------------------------------#
# ---------------------------------------------------------------------#
# User action required =>                                              #
# Update the following fields as per requirement                       #
# ---------------------------------------------------------------------#
#                                                                      #
# Add all source files(with path) separated by spaces inside braces    #
src=(src_path/tb_xxx.vhd src_path/xxx.vhd src_path/xyz.vhd)            #
#                                                                      #
# Name of top module                                                   #
top=tb_xxx                                                             #
#                                                                      #
# Name the output VCD file (with path e.g. path/*.vcd)                 #
output=output_path/xyz.vcd                                             #
#                                                                      #
# Declare the run time of simulation                                   #
run_time=1000ns                                                        #
#                                                                      #
# Call GTKWave (yes/no)                                                #
gtw=yes                                                                #
#                                                                      #
# ---------------------------------------------------------------------#
# Warning =>                                                           #
# Do not Edit anything after this line                                 #
# ---------------------------------------------------------------------#
# ---------------------------------------------------------------------#

# Echo user parameters-------------------------------------------------#

echo "*************************"
echo "** Parameters          **"
echo "*************************"
echo ""
echo "Files:"
count=1
for item in ${src[*]}
do
	echo "    $count) $item"
    ((count++))
done
echo "Top Module: $top"
echo "Output file: $output"
echo "Simulation Run time: $run_time"
echo "GTKWave Launch: $gtw"
echo ""

# Checking syntax------------------------------------------------------#

echo "*************************"
echo "** Syntax Check        **"
echo "*************************"
echo ""
for item in ${src[*]}
do
	ghdl -s $item
	if [ $? -eq 0 ]; then
		echo ""
		echo "Syntax check successfull for $item"
	else
		echo ""
		echo "Syntax check failed for $item"
		exit 1;
	fi
done

echo ""

# Analyse the design---------------------------------------------------#


echo "*************************"
echo "** Design Analysis     **"
echo "*************************"
echo ""
for item in ${src[*]}
do
	ghdl -a $item
	if [ $? -eq 0 ]; then
		echo ""
		echo "Analysis successfull for $item"
	else
		echo ""
		echo "Analysis failed for $item"
		exit 1;
	fi
done

echo ""

# Elaborate the design-------------------------------------------------#

echo "*************************"
echo "** Design Elaboration  **"
echo "*************************"
echo ""

ghdl -e $top
if [ $? -eq 0 ]; then
	echo ""
	echo "Elaboration successfull for $top"
else
	echo ""
	echo "Elaboration failed for $top"
	exit 1;
fi

echo ""

# Run the design-------------------------------------------------------#

echo "*************************"
echo "** Design Execution    **"
echo "*************************"
echo ""

ghdl -r $top --vcd=$output --stop-time=$run_time
if [ $? -eq 0 ]; then
	echo ""
	echo "Run successfull for $top"
else
	echo ""
	echo "Run failed for $top"
	exit 1;
fi

echo ""

# Launch GTKWave window if called--------------------------------------#

if [[($gtw == "yes")]]; then
	echo "*************************"
	echo "** Calling GTKWave     **"
	echo "*************************"
	echo ""

	gtkwave $output
	if [ $? -eq 0 ]; then
		echo ""
	else
		echo ""
		echo "Failed to Launch GTKWave"
		exit 1;
	fi

	echo ""
fi

echo "*************************"
echo "** Simulation Complete **"
echo "*************************"

# End of Script--------------------------------------------------------#

#!/usr/bin/env bash
#textFormating
Red="$(tput setaf 1)"
Green="$(tput setaf 2)"
reset=`tput sgr0` # turns off all atribute
Bold=$(tput bold)

#
baseName=$(basename $1 .fastq)
echo "${Red}${Bold} Processing ${reset}: "${1}""
bioawk -c fastx '{print "@"$name"\n"$seq"\n+\n"$qual}' $1 > ${baseName}_filtered.fastq
echo ""
echo "${Green}${Bold} Processed and saved as${reset} "${baseName}_filtered.fastq""

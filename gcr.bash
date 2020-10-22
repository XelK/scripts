#!/bin/bash

color1="34m"
color2="31m"
echo -e "\e[$color1---------------------------------------------"
echo "--- Compile and run program written in c  --- "
echo "--- compile and run last *.c updated file ---"
echo "--- you can also pass *.c file manually   ---"

if [ $# -lt 1 ]
then
	file=$(ls -c|grep "\.c"|head -n1|awk -F "." '{print $1}')
else
	file=$1
fi


if [[ ! -z "$file" ]];
then
	echo 	"---  - Compilation $file.c, in $file.out"
	echo -e "---  - Running 	$file.out\e[0m"
	gcc -Wall -std=c18 $file.c -o /tmp/$file.out && /tmp/$file.out
	echo -e "\e[$color1---------------------------------------------\e[0m"
	exit 0;
else
	echo -e "\e[$color2 ERROR! No *.c file found and no arguments was passed!\e[0m"
	echo -e "\e[$color1--------------------------------------------- \e[0m"
	exit 1;
fi

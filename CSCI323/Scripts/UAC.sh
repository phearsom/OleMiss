#!/bin/bash

Date=`date +%y%m%d`




while IFS=, read field1 field2 field3 field4 field5 field6
do
	
	`adduser --gecos $field1 $field2 $field3 $field4 $field5 $field6 --disabled-password`
	fullName="$(echo ${field2} | tr -s '_' ' ')"   
#	echo $field1 $field2 $field3 $field4 $field5 $field6 $field7
	pass="$field1""$Date"	
	echo $field1:$pass | chpasswd
	echo $pass
	echo $field1	
done < empRec.csv 



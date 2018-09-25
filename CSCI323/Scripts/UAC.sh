#!/bin/bash

Date=`date +%y%m%d`




while IFS=, read field1 field2 field3 field4 field5 field6
do
	fullName="$(echo ${field2} | tr -s '_' ' ')" 
	adduser $field1 --gecos "$field2,$field3,$field4,$field5,$field6" --disabled-password
	pass="$field1""$Date"	
	echo $field1:$pass | sudo chpasswd
#	echo $pass
#	echo $field1	
done < empRec.csv 



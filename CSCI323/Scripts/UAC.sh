#!/bin/bash

Date=`date +%y%m%d`




while IFS=, read field1 field2 field3 field4 field5 field6
do
	`tr _ " " < $field2 > $field2 `
	`adduser --gecos --disabled-password`

	
	chpasswd <<< "$field1:$field1+$Date"

done < empRec.csv 



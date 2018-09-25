#!/bin/bash

while IFS=, read field1
do
    sudo userdel -r $field1

done < userList.txt
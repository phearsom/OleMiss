#!/bin/bash

DATE=$(date +%y%m%d)
FILE="log.$DATE"

who >> $FILE
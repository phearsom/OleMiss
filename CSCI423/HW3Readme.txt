Files:
    HW3Readme.txt
    HW3.c
    

To compile HW3.c :: gcc HW3.c -lpthread

To Run: ./a.out [list of integers]

With no integers, an error will be thrown

[SAMPLE OUTPUT]
./a.out 6 7 8

The average value is:  7
The minimum value is:  6
The maximum value is:  8

Gregory Phillips
10678899

This program takes a list of integers, creates seperate threads
for the minimum, maximum and average functions and completes them
simataneously.
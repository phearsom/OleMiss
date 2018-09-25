#include <stdio.h>
#include <stdlib.h>

#define MAX_Length 255

struct WordFreq{
    char word[MAX_Length];
    int freq;
}WordFreq;

int main(int argc,char * argv[]){

    if(argc!=2){
        printf("Please run FILENAME\n");
        return;
    }

    FILE * fp;

    //OPEN FILE && CHECKS
    if(fp=fopen(argv[1],"r")){

        printf("File DOES NOT Exist.");  // FIX GRAMMAR ERROR
        return;
    }


    return 0;
}
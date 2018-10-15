#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int A = 10;

int main(){

    pid_t pid;
    pid = fork();

    if(pid < 0)
    {
        fprintf(stderr, "Fork Failed\n");
        return 1;
    }
    else if(pid == 0){
        A= A-5;
        printf("In child process, A = (%d)\n", A);

    }else
    {
        wait(NULL);

        A = A+5;

        printf("In parent process, A = (%d)\n", A);


    }

    return 0;
}

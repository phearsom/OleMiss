#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *avg(void *str);
void *min(void *ptr);
void *max(void *ptr);

double average;
int smallest;
int largest;

typedef struct numbers
{
    int size;
    int * values;
}numbers;

int main(int argc, char *argv[])
{
    if(argc == 1){
        fprintf(stderr, "Usage: ./a.out <at least one integer as input>\n");
        return(-1);
	}

    int i = 0;
    int copy[argc-1];
    for(i; i < (argc -1); i++)
    {
        copy[i] = atoi(argv[i+1]);
    }

    pthread_t thread1, thread2, thread3;
    int  t1, t2, t3;

    numbers ds = {argc - 1, copy};

    t1 = pthread_create(&thread1, NULL, (void *) avg, (void *) &ds);
    if(t1)
    {
        fprintf(stderr,"Error - pthread_create() return code: %d\n", t1);
        exit(EXIT_FAILURE);
    }

    t2 = pthread_create(&thread2, NULL, (void *) min, (void *) &ds);
    if(t2)
    {
        fprintf(stderr,"Error - pthread_create() return code: %d\n",t2);
        exit(EXIT_FAILURE);
    }

    t3 = pthread_create(&thread3, NULL, (void *) max, (void *) &ds);
    if(t3)
    {
        fprintf(stderr,"Error - pthread_create() return code: %d\n", t3);
        exit(EXIT_FAILURE);
    }



  

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    pthread_join(thread3, NULL);

    printf("The average value is:  %g\n", average);
    printf("The minimum value is:  %d\n", smallest);
    printf("The maximum value is:  %d\n", largest);

    exit(EXIT_SUCCESS);
}

void *avg(void *ptr)
{
    numbers * copy;
    copy = (numbers *) ptr;

    int sz = copy->size;
    int i;

    for(i = 0; i < sz; i++)
    {
        average += (copy->values[i]);
    }
    average = (int)(average
 / sz);
}

void *min(void *ptr)
{
    numbers * copy;
    copy = (numbers *) ptr;

    int sz = copy->size;
    int i;

    smallest = (copy->values[0]);
    for(i = 1; i < sz; i++)
    {
        if(smallest > (copy->values[i]))
        {
            smallest = (copy->values[i]);
        }
    }
}

void *max(void *ptr)
{
    numbers * copy;
    copy = (numbers *) ptr;

    int sz = copy->size;
    int i;

    largest = copy->values[0];

    for(i = 1; i < sz; i++)
    {
        if(largest < copy->values[i])
        {
            largest = copy->values[i];
        }
    }
}

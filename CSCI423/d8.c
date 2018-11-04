#include <pthread.h>
#include <stdio.h>

int sum; /* this data is shared by the thread(s) */
void *runner(void *param); /* threads call this function */

#define bool int
#define true 1
#define false 0

/* define the mutex variable */

typedef struct{
    bool value;
}lock;



int main(int argc, char *argv[])
{
	if (argc != 2) {
		fprintf(stderr,"usage: a.out <integer value>\n");
		return -1;
	}

	int N = atoi(argv[1]);

	if (N < 0) {
		fprintf(stderr,"%d must be >= 0\n",atoi(argv[1]));
		return -1;
	}

	pthread_t tid[N]; /* the thread identifier */
	pthread_attr_t attr; /* set of thread attributes */

	int i;

	sum = 0;

/* create the mutex lock */
???	
    lock *mutex  = malloc(sizeof(lock));



	/* get the default attributes */
	pthread_attr_init(&attr);

	/* create the thread */
	for (i=0; i<N; i++)
		pthread_create(&tid[i],&attr,runner,(void *)i);

	/* wait for the thread to exit */
	for (i=0; i<N; i++)
		pthread_join(tid[i],NULL);

	printf("sum = %d\n",sum);
}

/* The thread will begin control in this function, find the critical section and use mutex lock to protect it */
void *runner(void *param)
{
	int thread_no = (int) param;
	int i;

	for (i=0; i<1000; i++)
	{
		
        pthread_mutex_lock(&lock);

		sum++;
		sum--;
		
		pthread_mutex_unlock(&lock);


	}

	printf("This is thread %d, I have increased the sum value by 1 and then decreased the sum value by 1.\n", thread_no);

	pthread_exit(0);
}
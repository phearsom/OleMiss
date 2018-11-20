#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int sum; /* this data is shared by the thread(s) */
void *runner(void *param); /* threads call this function */
double random_double();
int pointsInCirlce = 0;
int totalPoints = 0;
int points = 50000000;
int threads;

//pi = 4 * (pointsInCirlce / totalPoints)

/* define the mutex variable */
pthread_mutex_t mutex;

int main(int argc, char *argv[])
{
	if (argc != 2) {
		fprintf(stderr,"usage: a.out <integer value>\n");
		return -1;
	}
    if (argv[1] < 0){
        fprintf(stderr,"<number of threads> should be a positive integer\n");
		return -1;
    }

	int N = atoi(argv[1]);
    threads = N;
    int toMake = points / N;

	pthread_t tid[N]; /* the thread identifier */
	pthread_attr_t attr; /* set of thread attributes */

	int i;

	//sum = 0;

/* create the mutex lock */
	pthread_mutex_init(&mutex, NULL);

	/* get the default attributes */
	pthread_attr_init(&attr);

	/* create the thread */
	for (i=0; i<N; i++)
		pthread_create(&tid[i],&attr,runner,(void *)i);

	/* wait for the thread to exit */
	for (i=0; i<N; i++)
		pthread_join(tid[i],NULL);

	double pi = 4 * ((double)(pointsInCirlce)/(double) points);
	printf("pi = (%f)\n", pi);
}

/* The thread will begin control in this function, find the critical section and use mutex lock to protect it */
void *runner(void *param)
{
	int thread_no = (int) param;
	int i;

	for (i=0; i<(points / threads); i++)
	{
		pthread_mutex_lock(&mutex);

        double x, y;

		/* entering critical section */
		x = random_double();
        y = random_double();
        if( sqrt(x*x + y*y) < 1.0 ) {
            pointsInCirlce++;
        }
		/* exiting critical section */

		pthread_mutex_unlock(&mutex);
	}
    

	pthread_exit(0);
}

double random_double()
{
 return random() / ((double)RAND_MAX + 1);
} 
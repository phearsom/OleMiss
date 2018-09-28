#include <stdio.h>

// include the header file that allows us to use dynamic memory management
#include <stdlib.h>

// predefine the maximum length of a word (i.e., Word_MAX_Length) using preprocessor
// command "#define" 
		

// define the structure WordFreq, which has a string variable word, an integer variable frequency
// and a struct WordFreq pointer variable next that will be used for linked list
struct WordFreq
{
	int frequency;
	struct WordFreq* next;
} WordFreq;

// define function insert that inserts the parameter into the linked list
void insert(struct WordFreq *);

// define the head pointer of the linked list and initialize it with NULL value
struct WordFreq * head = NULL;

void main(int argc, char * argv[])
{
	if (argc!=3)
	{
		printf("Please run as %s [filename]\n", argv[0]);
		return;
	}

	// define a FILE pointer variable f	
	FILE *f;
	FILE * out_file = fopen(argv[2],"w");

	// try to open file with the file name given in command line argument and assign the
	// returned FILE pointer value to f. If the file cannot be opened, print "File (name) does
	// not exist\n", where (name) is the file name given in command line argument
	if (!(f = fopen(argv[1], "r")))
	{
		printf("File %s does not exist\n", argv[1]);

		return;
	}

	// define a struct WordFreq pointer variable line and dynamically allocate memory space
	// of the size of struct WordFreq to line
	struct WordFreq * line = (struct WordFreq*) malloc(sizeof(struct WordFreq));
	
	// check if the dynamic memory allocation is successful. If not, print "Cannot do dynamic
	// memory management\n"
	if (line==NULL)
	{
		printf("Cannot do dynamic memory management\n");

		return;
	}

	printf("file content in %s:\n", argv[1]);

	// read a line of word and frequency in the file into member variables of line and check if
	// it reaches the end of the file (EOF)
	while (fscanf(f, "%d", &(line->frequency))!= EOF)
	{
		// print the values of member variables word and frequency in variable line
		printf("%d ", line->frequency);
		fprintf(out_file, "%d ", line -> frequency);

		// initialize the value of member variable next in variable line by NULL
		line->next = NULL;

		// call function insert to insert line into the linked list
		insert(line);

		// since the memory space pointed by line has been inserted into the linked list, // we need to dynamically allocate some other new memory space to line
		line = (struct WordFreq*) malloc(sizeof(struct WordFreq));

		// again, check if the dynamic memory allocation is successful. If not, print
		// "Cannot do dynamic memory management\n"
		if (line==NULL)
		{
			printf("Cannot do dynamic memory management\n");

			return;
		}
		
	}
	printf("\n");
	fprintf(out_file, "\n");
	// remember to free the memory space you've dynamically allocated to variable line
	free(line);
	
	printf("content in the linked list:\n");

	// traverse the linked list, print out each element and free its space
	// we stop until the value of head is NULL
	while (head!=NULL)
	{
		// detach the first element in the linked list and put it into variable line
		// hint: let variable line point to the first element in the linked list and then move 
		// the head pointer to point the next element in the linked list, which now
		// becomes the first element in the linked list
		line = head;
		head = head->next;

		// print the values of member variables word and frequency in variable line
		printf("%d ", line->frequency);
		fprintf(out_file,"%d ", line -> frequency);

		// remember to free the memory space you've dynamically allocated to the
		// element just detached from the linked list, which is now pointed by line
		free(line);		
	}
	printf("\n");
	// remember to close the file pointed by f
	fclose(f);
	fclose(out_file);
}

// remember we need to implement function insert
void insert(struct WordFreq * element)
{
	// we inserts the parameter element into the linked list by insertion sorting
	// hint: traverse the linked list and compare the frequency of each word in the list with
	// the frequency of element. When we find the first word in the list that has a less or equal
	// frequency, we insert element before that word in the list
	
	// for traversing and inserting purposes, we define two temporary variables, where temp
	// points to the word we are currently looking at in the linked list and pretemp points to
	// the word before that
	struct WordFreq * temp = head;
	struct WordFreq * pretemp = NULL;

	// keep traversing until we reach the end of the list or current word has a less or equal
	// frequency compared to the frequency of element. 
	while (temp != NULL && temp->frequency < element->frequency)
	{
		// move the two temporary variables to check the next word in the linked list
		pretemp = temp;
		temp = temp->next;
	}

	// check if we should insert element at the beginning of the linked list
	if (pretemp==NULL)
	{
		// yes, insert the element at the beginning of the linked list
		element->next = head;
		head = element;
	}
	else
	{
		// no, insert element between words pointed by pretemp and temp
		pretemp->next = element;
		element->next = temp;
	}	
}

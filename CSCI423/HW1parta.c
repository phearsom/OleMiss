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
void append(struct WordFreq *);

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

	fprintf(out_file,"file content in %s:\n", argv[1]);

	// read a line of word and frequency in the file into member variables of line and check if
	// it reaches the end of the file (EOF)
	while (fscanf(f, "%d", &(line->frequency))!= EOF)
	{
		// print the values of member variables word and frequency in variable line
		printf("%d ", line->frequency);
		fprintf(out_file, "%d ", line -> frequency);

		// initialize the value of member variable next in variable line by NULL
		line->next = NULL;

		append(line);

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
	
	fprintf(out_file, "\n");
	// remember to free the memory space you've dynamically allocated to variable line
	free(line);
	
	fprintf(out_file,"content in the linked list:\n");

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
		fprintf(out_file,"%d ", line->frequency);
		//fprintf(out_file,"%d ", line -> frequency);

		// remember to free the memory space you've dynamically allocated to the
		// element just detached from the linked list, which is now pointed by line
		free(line);		
	}
	//printf("\n");
	// remember to close the file pointed by f
	fclose(f);
	fclose(out_file);
}

/* Given a reference (pointer to pointer) to the head 
   of a list and an int, appends a new node at the end  */
void append(struct WordFreq * element) 
{ 
   
  
    struct WordFreq *last = head;  /* used in step 5*/
   
    /* 2. put in the data  */
   
  
    /* 3. This new node is going to be the last node, so make next  
          of it as NULL*/
    element->next = NULL; 
  
    /* 4. If the Linked List is empty, then make the new node as head */
    if (head == NULL) 
    { 
       head = element; 
       return; 
    }   
       
    /* 5. Else traverse till the last node */
    while (last->next != NULL) 
        last = last->next; 
   
    /* 6. Change the next of last node */
    last->next = element; 
    return;     
}
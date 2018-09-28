#include <stdio.h>
 
int main() { 
	// create a FILE typed pointer
	FILE *file_pointer; 
	
	// open the file "name_of_file.txt" for writing
	file_pointer = fopen("name_of_file.txt", "w"); 
 
	// Write to the file
	fprintf(file_pointer, "This will write to a file.");
	
	// Close the file
	fclose(file_pointer); 
	return 0;
}
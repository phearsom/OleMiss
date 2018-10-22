import java.io.*;
import java.util.Scanner;


public class SudokuSolver {

	public static void main(String[] args) throws FileNotFoundException {
		
		int [][] nums = new int [9][9];
		File file = new File("h1.txt");
		Scanner scan = new Scanner(file);
		
		for(int i = 0; i < 9; i++) 
			for(int j = 0; j < 9; j++)
				nums [i][j] = scan.nextInt();  // Read nums from txt and input into the 2D array
		
		scan.close();
		Sudoku s = new Sudoku(nums); 
	
		
		if(s.solveSudoku())
		{
			s.displaySudoku();
		}
		else
		{
			System.out.println("Unsuccessful");
		}

	}

}


class Sudoku
{
	private int[][] sudoku;
	private static final int UNASSIGNED = 0;
	
	public Sudoku()
	{
		sudoku = new int[9][9];
	}
	
	public Sudoku(int sudoku[][])
	{
		this.sudoku= sudoku;
	}
	
	// Checks to see if number is allowed
	private boolean isAllowed(int row, int col,int number)
	{
		return !(containsInRow(row, number) || containsInCol(col, number) || containsInBox(row, col, number));
	}
	
	
	// Backtracking method, Try a number, go along, and keep checking. If not, backtrack until you can move forward again. 
	public boolean solveSudoku()
	{
		for(int row=0;row<9;row++)
		{
			for(int col=0;col<9;col++)
			{
				if(sudoku[row][col]==UNASSIGNED)
				{
					for(int number=1;number<=9;number++)
					{
						if(isAllowed(row, col, number))
						{
							sudoku[row][col] = number;
							if(solveSudoku())
							{
								return true;
							}
							else
							{
								sudoku[row][col] = UNASSIGNED;
							}
						}
					}
					return false;
				}
			}
		}
		return true;
	}
	
	// Essentially a toString Function.
	public void displaySudoku()
	{
		for(int i=0;i<9;i++)
		{
			
			for(int j=0;j<9;j++)
			{
				
				System.out.print(" " + sudoku[i][j] + " ");
				
			}
			
			System.out.println();
		}
		
	}
	
	
	private boolean containsInRow(int row,int number)
	{
		for(int i=0;i<9;i++)
		{
			if(sudoku[row][i]==number)
			{
				return true;
			}
		}
		return false;
	}
	

	
	private boolean containsInBox(int row, int col,int number)
	{
		int r = row - row%3;
		int c = col - col%3;
		for(int i=r;i<r+3;i++)
		{
			for(int j=c;j<c+3;j++)
			{
				if(sudoku[i][j]==number)
				{
					return true;
				}
			}
			
		}
		return false;
	}
	
	private boolean containsInCol(int col,int number)
	{
		for(int i=0;i<9;i++)
		{
			if(sudoku[i][col]==number)
			{
				return true;
			}
		}
		return false;
	}


	
}
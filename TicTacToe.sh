#! /bin/bash 

echo " #### Welcome to Tic-Tac-Toe Game #### "

declare -a board

# Constant maximum cell
max_Cell=9

# Variable to count used cell
cell_Count=0  

# To Create board
function createBoard()
{

		for (( i=0;i<7;i=i+3 ))
		do
				${board[$i]} 
			        ${board[$i+1]} 
		         	${board[$i+2]} 
				
		done
}

# To assign symbol for player
function  assignSymbol()
{
		echo "enter number 1 for X or 2 for O " 
		read symbol
		if [[ $symbol -eq 1 ]]
		then
				player="User"
				#echo "Your symbol is X "
				#echo "Computer symbol is O"
				user="X"
				computer="O"
		else
				player="Computer"
				#echo "Your symbol is O "
				#echo "Computer symbol is X"
				user="O"
				computer="X"
		fi
}
#Call Function 
createBoard
assignSymbol

#! /bin/bash 

echo " #### Welcome to Tic-Tac-Toe Game #### "

#initialization of array
declare -a board

# Constant maximum cell
max_Cell=9

# Variable to count used cell
cell_Count=0  

# Reset board to start play

board=(1 2 3 4 5 6 7 8 9)

# To assign symbol for player
function  assignSymbol()
{
		echo "enter number 1 for X or 2 for O " 
		read symbol
		if [[ $symbol -eq 1 ]]
		then
				player="User"
				user="X"
				computer="O"
		else
				player="Computer"
				user="O"
				computer="X"
		fi
}

#To show Board
function showBoard()
{
   echo "  ------------"
                    for (( i=0;i<7;i=i+3 ))
		do
				echo " | ${board[$i]} | ${board[$i+1]} | ${board[$i+2]} |"
				echo "  ------------"
		done
}
# To know who play
#function switchPlayer()
{
   if [[ $player == "User" ]]
   then
      userPlay
   else
      computerPlay
   fi
}

#  For user play
function userPlay()
{
		player="User"
		if [[ $cell_Count -lt $max_Cell ]]
		then
				read -p "Enter Number Between 1 to 9:" position
				if [[ ${board[$position-1]} -eq $position ]]
				then
						board[$position-1]=$user
						((cell_Count++))
						showBoard
				else
						echo "Invalid Cell"
						userPlay
				fi
		computerPlay
		else
				echo "  Game is Tie !!"
				exit
		fi
}
# For computer play
function computerPlay()
{
		player="Computer"
		flag=0
		if [[ $cell_Count -lt $max_Cell ]]
		then
				echo "Computer play"

		if [ $flag -eq 0 ]
		then
				checkCorner
		fi
		if [ $flag -eq 0 ]
		then
				checkCenter
		fi
		if [ $flag -eq 0 ]
		then
				checkSides
		fi
		
		userPlay
		else
				echo "Game is Tie !!"
				exit
		fi
}
# To check condition for computer
function checkCondition()
{
		showBoard
		flag=1
		((cell_Count++))
}
# To check Corner is available 
function checkCorner()
{
		for((cell=0;cell<7;cell=$cell+6))
		do
				if [[ ${board[$cell]} == $((cell+1)) ]]
				then
						board[$cell]=$computer
						checkCondition
						break
				elif [[ ${board[$cell+2]} == $((cell+3)) ]]
				then
						board[$cell+2]=$computer
						checkCondition
						break
				fi
		done
}
# To check Center for computer
function checkCenter()
{
		cell=0
		if [[ ${board[$cell+4]} -eq $((cell+5)) ]]
		then
				board[$cell+4]=$computer
				checkCondition
		fi
}
# To check sides for computer
function checkSides() 
{
		for((cell=0;cell<7;cell=$cell+2))
		do
				if [[ ${board[$cell]} -eq $((cell+1)) ]]
				then
						board[$cell]=$computer
						checkCondition
				fi
		done
}
#Call Function 
assignSymbol
showBoard
switchPlayer
userPlay

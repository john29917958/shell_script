#!/bin/bash
# Pseudocode
# =======================
# 1: Add two numbers
# 2: Substract
# 3: Multiply two numbers
# 4: Divide

function add() {
	# echo "You have choosed to add two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	local result=$(echo "$num1 + $num2" | bc | awk '{printf "%f", $0}')
	echo $result
}

function subtract() {
	# echo "You have choosed to subtract two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	local result=$(echo "$num1 - $num2" | bc | awk '{printf "%f", $0}')
	echo $result
}

function multiply() {
	# echo "You have choosed to multiply two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	local result=$(echo "$num1 * $num2" | bc | awk '{printf "%f", $0}')
	echo $result
}

function divide() {
	# echo "You have choosed to divide two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	local result=$(echo "$num1 / $num2" | bc | awk '{printf "%f", $0}')
	echo $result
}

function read_input() {
	read -r -d "" read_message <<- EOM
		Please input a function number or q to exit.
		Functions:
		1: Add two numbers
		2: Substract two numbers
		3: Multiply two numbers
		4: Divide two numbers
		Your input:
	EOM
	read -p "$read_message " input
	echo $input
}

echo "Welcome to a simple Bash calculator!"
input=$(read_input)
result=""
while [[ $input != "q" ]]; do
	if [[ $input -eq 1 ]]; then
		result=$(add)
		echo "The result is: $result"
	elif [[ $input -eq 2 ]]; then
		result=$(subtract)
		echo "The result is: $result"
	elif [[ $input -eq 3 ]]; then
		result=$(multiply)
		echo "The result is: $result"
	elif [[ $input -eq 4 ]]; then
		result=$(divide)
		echo "The result is: $result"
	else
		echo "Invalid input!"
	fi

	echo ""
	input=$(read_input)
done

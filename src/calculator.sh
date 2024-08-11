#!/bin/bash
# Pseudocode
# =======================
# 1: Add two numbers
# 2: Substract
# 3: Multiply two numbers
# 4: Divide

echo "Welcome to a simple Bash calculator!"
echo "Please input a function number or q to exit."
echo "Functions:"
echo "1: Add two numbers"
echo "2: Substract two numbers"
echo "3: Multiply two numbers"
echo "4: Divide two numbers"
read -p "Your input: " input

function add() {
	# echo "You have choosed to add two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	local result=$(($num1 + $num2))
	echo $result
}

function subtract() {
	# echo "You have choosed to subtract two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	result=$(($num1 - $num2))
	echo $result
}

function multiply() {
	# echo "You have choosed to multiply two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	result=$(($num1 * $num2))
	echo $result
}

function divide() {
	# echo "You have choosed to divide two numbers."
	read -p "Please input a number: " num1
	read -p "Please input second number: " num2
	result=$(($num1 / $num2))
	echo $result
}

result=""
if [ $input -eq 1 ]; then
	result=$(add)
elif [ $input -eq 2 ]; then
	result=$(subtract)
elif [ $input -eq 3 ]; then
	result=$(multiply)
elif [ $input -eq 4 ]; then
	result=$(divide)
fi

echo "The result is: $result"

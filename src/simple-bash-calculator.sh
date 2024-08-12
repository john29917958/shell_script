#!/bin/sh

#######################################
# Add two numbers which are read from user's input.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   The sum of two numbers read from user's input.
#######################################
add_two_numbers() {
  local addend1
  local addend2
  read -p "Please input the first number as an addend: " -r addend1
  read -p "Please input the second number as an addend: " -r addend2
  local sum=$(add "$addend1" "$addend2")
  echo $sum
}

#######################################
# Add two numbers.
# Globals:
#   None
# Arguments:
#   addend1 The first addend number.
#   addend2: The second addend number.
# Returns:
#   The sum of two numbers.
#######################################
add() {
  local addend1=$1
  local addend2=$2
  local sum=$(echo "$addend1 + $addend2" | bc | awk '{printf "%f", $0}')
  echo "$sum"
}

#######################################
# Subtract two numbers which are read from user's input.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   The difference of two numbers read from user's input.
#######################################
subtract_two_numbers() {
  local minuend
  local subtrahend
  read -p "Please input the first number as the minuend: " -r minuend
  read -p "Please input the second number as the subtrahend: " -r subtrahend
  local difference=$(subtract "$minuend" "$subtrahend")
  echo "$difference"
}

#######################################
# Subtract two numbers.
# Globals:
#   None
# Arguments:
#   minuend The number it is subtracted from.
#   subtrahend The number being subtracted.
# Returns:
#   The difference of two numbers.
#######################################
subtract() {
  local minuend=$1
  local subtrahend=$2
  local difference=$(echo "$minuend - $subtrahend" | bc | awk '{printf "%f", $0}')
  echo "$difference"
}

#######################################
# Multiply two numbers which are read from user's input.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   The product of two numbers.
#######################################
multiply_two_numbers() {
  local multiplier
  local multiplicand
  read -p "Please input the first number as the multiplier: " -r multiplier
  read -p "Please input the second number as the multiplicand: " -r multiplicand
  local product=$(multiply "$multiplier" "$multiplicand")
  echo "$product"
}

#######################################
# Multiply two numbers.
# Globals:
#   None
# Arguments:
#   multiplier The number by which it is multiplied.
#   multiplicand The quantity of the multiplier, that is, the number by which
#		the multiplier is multiplied.
# Returns:
#   The product of two numbers.
#######################################
multiply() {
  local multiplier=$1
  local multiplicand=$2
  local product=$(echo "$multiplier * $multiplicand" | bc | awk '{printf "%f", $0}')
  echo "$product"
}

#######################################
# Divide two numbers which are read from user's input.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   The quotient of two numbers.
#######################################
divide_two_numbers() {
  local dividend
  local divisor
  read -p "Please input the first number as the dividend: " -r dividend
  read -p "Please input the second number as the divisor: " -r divisor
  local quotient=$(divide $dividend $divisor)
  echo "$quotient"
}

#######################################
# Divide two numbers.
# Globals:
#   None
# Arguments:
#   dividend The number by which it is being divided.
#   divisor The number that is doing the dividing.
# Returns:
#   The quotient of two numbers.
#######################################
divide() {
  dividend=$1
  divisor=$2
  local quotient=$(echo "$dividend / $divisor" | bc | awk '{printf "%f", $0}')
  echo "$quotient"
}

#######################################
# Read user's input number as calculator function number.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   The calculator function number.
#######################################
read_func_num() {	
  read -p "Please input a function number, h for help or q to exit: " -r \
    function_number
  echo "$function_number"
}

#######################################
# Show helper message.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# Outputs:
#   Writes the helper message to stdout.
#######################################
show_help_message() {
  read -r -d "" help_message <<-EOM
		Welcome to the Simple Bash Calculator! Here are available calculation functions with function numbers:
		1: Add two numbers
		2: Substract two numbers
		3: Multiply two numbers
		4: Divide two numbers
	EOM
  echo "$help_message"
}

show_help_message
input=$(read_func_num)
while [ "$input" != "q" ]; do
  if [ "$input" == "1" ]; then
    result=$(add_two_numbers)
    echo "The sum is: $result"
  elif [ "$input" == "2" ]; then
    result=$(subtract_two_numbers)
    echo "The difference is: $result"
  elif [ "$input" == "3" ]; then
    result=$(multiply_two_numbers)
    echo "The product is: $result"
  elif [ "$input" == "4" ]; then
    result=$(divide_two_numbers)
    echo "The quotient is: $result"
  elif [ "$input" == "h" ]; then
    show_help_message
  else
    echo "Invalid input!"
  fi
  input=$(read_func_num)
done

echo "Thanks for using Simple Bash Calculator!"

#!/bin/sh

echo "This is a printing nine-nine table program. It implements the concept of nested for loop."
echo "Program starts"
for i in $(seq 1 9); do
  for j in $(seq 1 $i); do
    echo "$i x $j = $(($i * $j))"
  done
done
echo "Program ends"

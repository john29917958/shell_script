#!/bin/sh

echo "This is a nested for loop program. It implements the nine-nine table."
for i in $(seq 1 9); do
	for j in $(seq 1 $i); do
		echo "$i x $j = $(($i * $j))"
	done
done

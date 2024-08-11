#!/bin/sh

echo "This is a for loop program. This will prints numbers from 1 to 10: "
max=10
for i in $(seq 1 $max); do
	echo "$i"
done
echo "Program exits."

#!/bin/bash

scripts=(
	"./town1.sh"
	"./town2.sh"
	"./town3.sh"
	"./town4.sh"
)

parallel -j 4 ::: "${scripts[@]}"
echo "done"
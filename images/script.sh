#!/bin/bash

COUNTER=0
for file in *.png
do
 mv "$file" "$COUNTER.jpg"
 let "COUNTER++"
done

#!/bin/bash

COUNTER=0
for file in *
do
 mv "$file" "cici/$COUNTER.jpg"
 let "COUNTER++"
done

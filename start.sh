#!/bin/bash

#Date 2014-11-27
#Author: Giorgos Papoutsis


#RANDOM=shuf -i 200-65000 -n 2

N=100

for I in 1 2 3 4 5 6
do
 for code in US US0 MY CN;
 do
 RANDOM='shuf -i 200-65000 -n 1'
 ./testSoLR.sh $RANDOM $code  2>&1 > /dev/null &
 done
done

















exit

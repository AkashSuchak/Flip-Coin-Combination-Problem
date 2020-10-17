#! /bin/bash

#Author : Akash Suchak
#Flipping a coin to Display Heads or Tails

#Random Value 0 or 1
isCheck=$((RANDOM%2))

#Checking Heads or Tails
if [ "$isCheck" -eq 0 ]; then
	echo "Heads"
else
	echo "Tails"
fi

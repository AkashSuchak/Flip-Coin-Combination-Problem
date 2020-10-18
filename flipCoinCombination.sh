#! /bin/bash

#Author : Akash Suchak
#As A Simulator, Lopp through Multiple times of flipping a coin store
#the singlet combination in a dictionary. Finally determine the
#percentage of the Singlet combination.


#User-Input
read -p "Enter Number : " number

#Declaring Dictionary
declare -A coin

totalHead=0
totalTail=0

if [[ $number ]] && [ "$number" -eq "$number" 2>/dev/null -a  "$number" -gt 0 ]; then

	#Flipping Coin Till User-Input
	for (( i=1; i<="$number"; i++ ))
	do
		#Random Value 0 or 1
		isCheck=$((RANDOM%2))

		#Checking Heads or Tails
		if [ "$isCheck" -eq 0 ]; then
			totalHead=$(("$totalHead" + 1 ))
		else
			totalTail=$(("$totalTail" + 1 ))
		fi
	done
	#Store Into Dictionary
	coin[h]=$totalHead
	coin[t]=$totalTail

	#Displaying results
	echo "Out of $number Times"
	echo "Heads : ${coin[h]} -- Tails : ${coin[t]}"

	#Counting Percentage and Display
	headPer=`awk -v number=$number -v totalHead=${coin[h]} 'BEGIN{result=(100 * totalHead  / number); print result}'`
	tailPer=`awk -v number=$number -v totalTail=${coin[t]} 'BEGIN{result=(100 * totalTail  / number); print result}'`
	echo "Percentage Display"
	echo "Heads : $headPer %  -- Tails : $tailPer %"
else
	echo "Wrong Input !!!"
fi

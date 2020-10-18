#! /bin/bash

#Author : Akash Suchak
#As A Simulator, Lopp through Multiple times of flipping a coin store
#the singlet combination in a dictionary. Finally determine the
#percentage of the Singlet combination.


#User-Input
read -p "Enter Number : " number

#Declaring Dictionary
declare -A coin

hh=0
ht=0
th=0
tt=0

if [[ $number ]] && [ "$number" -eq "$number" 2>/dev/null -a  "$number" -gt 0 ]; then

	#Flipping Coin Till User-Input
	for (( i=1; i<="$number"; i++ ))
	do
		#Random Value 0 or 1
		coin1=$((RANDOM%2))
		coin2=$((RANDOM%2))

		#Checking Doublet
		if [ "$coin1" -eq 0 -a "$coin2" -eq 0 ]; then
			hh=$(("$hh" + 1 ))

		elif [ "$coin1" -eq 0 -a "$coin2" -eq 1 ]; then
                        ht=$(("$ht" + 1 ))

		elif [ "$coin1" -eq 1 -a "$coin2" -eq 0 ]; then
                        th=$(("$th" + 1 ))

		elif [ "$coin1" -eq 1 -a "$coin2" -eq 1 ]; then
                        tt=$(("$tt" + 1 ))
		fi
	done
	#Store Into Dictionary
	coin[hh]=$hh
	coin[ht]=$ht
	coin[th]=$th
        coin[tt]=$tt

	#Displaying results
	echo "Out of $number Times"
	for j in ${!coin[@]}
	do
		echo "$j -- ${coin[$j]}"
	done

	#Counting Percentage and Display
	hh_Per=`awk -v number=$number -v hh=${coin[hh]} 'BEGIN{result=(100 * hh  / number); print result}'`
	ht_Per=`awk -v number=$number -v ht=${coin[ht]} 'BEGIN{result=(100 * ht  / number); print result}'`
	th_Per=`awk -v number=$number -v th=${coin[th]} 'BEGIN{result=(100 * th  / number); print result}'`
        tt_Per=`awk -v number=$number -v tt=${coin[tt]} 'BEGIN{result=(100 * tt  / number); print result}'`

	echo "Percentage Display"
	echo "hh : $hh_Per %, ht : $ht_Per %, th : $th_Per %, tt : $tt_Per %"
else
	echo "Wrong Input !!!"
fi

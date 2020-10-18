#! /bin/bash

#Author : Akash Suchak
#As A Simulator, Do the same Triplet Combination


#User-Input
read -p "Enter Number : " number

#Declaring Dictionary
declare -A coin
declare -A display


if [[ $number ]] && [ "$number" -eq "$number" 2>/dev/null -a  "$number" -gt 0 ]; then

	#Flipping Coin Till User-Input
	for (( i=1; i<="$number"; i++ ))
	do
		#Random Value 0 or 1
		coin1=$((RANDOM%2))
		coin2=$((RANDOM%2))
		coin3=$((RANDOM%2))

		#Checking Triplet Combination
		if [ "$coin1" -eq 0 -a "$coin2" -eq 0 -a "$coin3" -eq 0 ]; then
			hhh=$(("$hhh" + 1 ))

		elif [ "$coin1" -eq 0 -a "$coin2" -eq 0 -a "$coin3" -eq 1 ]; then
                        hht=$(("$hht" + 1 ))

		elif [ "$coin1" -eq 0 -a "$coin2" -eq 1 -a "$coin3" -eq 1 ]; then
                        htt=$(("$htt" + 1 ))

		elif [ "$coin1" -eq 0 -a "$coin2" -eq 1 -a "$coin3" -eq 0 ]; then
                        hth=$(("$hth" + 1 ))

		elif [ "$coin1" -eq 1 -a "$coin2" -eq 0 -a "$coin3" -eq 0 ]; then
                        thh=$(("$thh" + 1 ))

                elif [ "$coin1" -eq 1 -a "$coin2" -eq 0 -a "$coin3" -eq 1 ]; then
                        tht=$(("$tht" + 1 ))

                elif [ "$coin1" -eq 1 -a "$coin2" -eq 1 -a "$coin3" -eq 0 ]; then
                        tth=$(("$tth" + 1 ))

                elif [ "$coin1" -eq 1 -a "$coin2" -eq 1 -a "$coin3" -eq 1 ]; then
                        ttt=$(("$ttt" + 1 ))

		fi
	done

	#Store Into Dictionary
	coin[hhh]=$hhh
	coin[hht]=$hht
	coin[htt]=$htt
        coin[hth]=$hth
	coin[thh]=$thh
        coin[tht]=$tht
        coin[tth]=$tth
        coin[ttt]=$ttt


	#Counting Percentage and Displaying results
	echo "Flipping Coins $number Times"
	for k in ${!coin[@]}
	do
		display[$k]=`awk -v number=$number -v a=${coin[$k]} 'BEGIN{result=(100 * a  / number); print result}'`
		echo "$k : ${display[$k]} %"
	done
else
	echo "Wrong Input !!!"
fi

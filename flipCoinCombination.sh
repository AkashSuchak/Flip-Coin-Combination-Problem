#! /bin/bash

#Author : Akash Suchak
#As A Simulator, Sort the Singlet, Doublet and Triplet Combination and show the winning Combination


#User-Input
read -p "Enter Number : " num
echo "Flipping Coins $num Times"
echo "============================"

#Counting Percentage, Storing into Dictionary and Displaying Winner
function winnerDeclare(){
	max=0
        for k in ${!coin[@]}
        do
        	#display[$k]=`awk -v number=$number -v a=${coin[$k]} 'BEGIN{result=(100 * a  / number); print result}'`
		display[$k]=$((100 * ${coin[$k]}  / $number))

                #echo "$k : ${display[$k]}%"

                #If Winner is more than 1
                if [ "$max" -lt "${display[$k]}" ]; then
                	max="${display[$k]}"
                        winner=()
                        winner[$k]="$max"

                elif [ "$max" -eq "${display[$k]}" ]; then
                        winner[$k]="$max"
                fi
        done
	echo "$1 Winners"
        echo "----------------"

	for l in ${!winner[@]}
        do
	        echo "$l : ${winner[$l]}%"
        done
	echo "============================"
}

main=(singlet doublet triplet)

#Declaring Dictionary
declare -A coin #For Values
declare -A display #For Percentage
declare -A winner #Multiple Winner

function findwinner(){
        number=$1

        if [[ $number ]] && [ "$number" -eq "$number" 2>/dev/null -a  "$number" -gt 0 ]; then
		for (( p=0; p<3; p++ ))
		do
			coin=()
			display=()
			winner=()
        		arrValue=(h t)

                	#Flipping Coin Till User-Input
	                for (( i=1; i<="$number"; i++ ))
        	        do
                	        #Random Value 0 or 1
                        	coin1=$((RANDOM%2))
				if [ "$p" -gt 0 ]; then
		                        coin2=$((RANDOM%2))
				fi
				if [ "$p" -gt 1 ]; then
        	                	coin3=$((RANDOM%2))
				fi
				case $p in
					0)
                		    	        #Checking singlet Combination
                        			key=${arrValue[$coin1]}
						;;
					1)
                                        	#Checking Doublet Combination
	                                        key=${arrValue[$coin1]}${arrValue[$coin2]}
        	                                ;;
					2)
                	                        #Checking Triplet Combination
                        	                key=${arrValue[$coin1]}${arrValue[$coin2]}${arrValue[$coin3]}
                                	        ;;
				esac
		                key_value=${coin[$key]}

        		        if [ -z "$key_value" ]; then
                			key_value=0
                        	fi
	                        key_value=$(($key_value + 1))
        	               	coin[$key]=$key_value
               		 done

			#Calling Function
        	        winnerDeclare ${main[$p]}
		done
        else
                echo "Wrong Input !!!"
        fi
}

findwinner $num

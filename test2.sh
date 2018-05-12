#!/bin/bash

clear

#echo $(tput cols)

columns=$(tput cols)

let barlength=$columns-10


for ((number=0; number <= $barlength; number++)) {
	#if (( $number % 5 == 0 ))
		#then {
			#echo "$number is divisible by 5 "
			#bar = `printf '.%.0s' {0..$number}`
			
			# nifty formula to get correct percentage for the given barlength
			# NOTE: let is necessary to get integer instead of string
			let progress=($number*100/$barlength*100)/100 
			
			printf "\r%3s%% " "$progress"
			
			# See: https://stackoverflow.com/questions/5799303/print-a-character-repeatedly-in-bash/17030976#17030976
			# The default behavior for printf if you give it more arguments than there are specified in the format string
			# is to loop back to the beginning of the format string and run it again.
			printf "%0.s|" $(seq 0 $number)
			
			#printf "%*s" "$number" | tr ' ' "|"
			
			
			
			sleep .1
		#}
	#fi
}

printf "\n"




#for i in {1..100}; do echo -n =; done

exit 0

#!/bin/bash


##################################
## This is the script for the transit managment game
## Seperated from the main script
##################################

# Clear the terminal page
clear

# Function to run the game
TMM() {
	clear
	# Placeholders in the function for Rollies
	responseRoll=0
	responsesMade=0
	score=0
	rerollchances=4
	DocumentMaker
	Rollies
}

# Document maker program
DocumentMaker(){
	#If chain to remove files to avoid dupes
	#Placeholder variables for the file locations to copy and paste
	ShipDocument=~/Desktop/DND/Ship.txt
	SupplyDocument=~/Desktop/DND/Supply.txt
	DeliveryDocument=~/Desktop/DND/Delivery.txt
	if [[ -f "$ShipDocument" || -f "$SupplyDocument" || -f "$DeliveryDocument" ]]; then
		sleep 1
		rm -r $ShipDocument
		rm -r $SupplyDocument
		rm -r $DeliveryDocument
		echo files deleted
	else

#### Documents building for the Ship/Supply/Delivery documents
# Ship document maker.txt
echo "Magic - Personal class ship - Dark Matter Engine class 1" >> ~/Desktop/DND/Ship.txt
echo "Confederate - Transport class ship - Dark Matter Engine class 3" >> ~/Desktop/DND/Ship.txt
echo "Exlipse - Frigate class ship - Dark Matter Engine class 4" >> ~/Desktop/DND/Ship.txt
echo "Coquette - Corvette class ship - Dark Matter Engine class 2" >> ~/Desktop/DND/Ship.txt
echo "Penguin - Light Cruiser class ship - Dark Matter Engine class 3" >> ~/Desktop/DND/Ship.txt
echo "Uproar - Heavy Cruiser class ship - Dark Matter Engine class 3" >> ~/Desktop/DND/Ship.txt
echo "Galactius - Captial class ship - Dark Matter Engine class 5" >> ~/Desktop/DND/Ship.txt
echo "Astute - Personal Size - Dark Matter Engine class 1" >> ~/Desktop/DND/Ship.txt
echo "Tormentor - Heavy Cruiser class ship - Dark Matter Engine class 3" >> ~/Desktop/DND/Ship.txt
echo "Blackmore - Light Cruiser class ship - Dark Matter Engine class 3" >> ~/Desktop/DND/Ship.txt
echo "Ellinore - Frigate class ship - Dark Matter Engine class 4" >> ~/Desktop/DND/Ship.txt
echo "Stronghold - Transport class ship - Dark Matter Engine class 3" >> ~/Desktop/DND/Ship.txt
echo "Indignant - Corvette class ship - Dark Matter Engine class 2" >> ~/Desktop/DND/Ship.txt
echo "Colossus - Personal class ship - Dark Matter Engine class 1" >> ~/Desktop/DND/Ship.txt
echo "Atlantis - Capital class ship - Dark Matter Engine class 5" >> ~/Desktop/DND/Ship.txt

# Supply document .txt
echo "Lloydium" >> ~/Desktop/DND/Supply.txt
echo "Rations" >> ~/Desktop/DND/Supply.txt
echo "Clothing" >> ~/Desktop/DND/Supply.txt
echo "Personal" >> ~/Desktop/DND/Supply.txt
echo "Unmarked packages" >> ~/Desktop/DND/Supply.txt
echo "Magnensium" >> ~/Desktop/DND/Supply.txt
echo "Urnainum" >> ~/Desktop/DND/Supply.txt
echo "Anti-Matter Mines" >> ~/Desktop/DND/Supply.txt
echo "Neutron Torpedos" >> ~/Desktop/DND/Supply.txt
echo "Titanium" >> ~/Desktop/DND/Supply.txt
echo "Medicine" >> ~/Desktop/DND/Supply.txt
echo "Luxury Foods (Organic)" >> ~/Desktop/DND/Supply.txt
echo "Heavy Cannon Round" >> ~/Desktop/DND/Supply.txt
echo "AI core componets" >> ~/Desktop/DND/Supply.txt
echo "Repair Drones" >> ~/Desktop/DND/Supply.txt
echo "Anti-Matter Carbines" >> ~/Desktop/DND/Supply.txt
echo "Adamant Hardsuit" >> ~/Desktop/DND/Supply.txt

# Delivery document .txt
echo "Load 4000 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 100 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 100 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 500 lbs" >> ~/Desktop/DND/Delivery.txt
echo "Load 500 lbs" >> ~/Desktop/DND/Delivery.txt
echo "Load 100 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 100 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 250 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 250 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 4000 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 500 lbs" >> ~/Desktop/DND/Delivery.txt
echo "Load 500 lbs" >> ~/Desktop/DND/Delivery.txt
echo "Load 4000 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 10000 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 100 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 250 Tons" >> ~/Desktop/DND/Delivery.txt
echo "Load 10000 Tons" >> ~/Desktop/DND/Delivery.txt
fi
}
# This is the function to represent the game

Rollies() {
	clear
	printf "\n\n\nHere is the report of what is transported is it right?:\n\n\n"
	sleep 1
	# Pulls the document statment to start 
	for challengeRoll in $(seq 0 2 20)
		do
				sleep 1
				printf "\n\n\n"
				printf "\n\n\nRoll for Response\n\n\n"
				DocumentReader
				sleep 3
				#Roll for response
				responseRoll=$(( $RANDOM % 20 +1 ))
				#ReRoll option
				printf "You rolled $responseRoll\nDo you wish to reroll?\n"
				while true; do
					select rollagain in Keep_Roll Reroll; do
						case $rollagain in
		
						Keep_Roll)
							break 2
							;;
						Reroll)
							((rerollchances--))
							if [[ $rerollchances -le 0 ]]; then
								sleep 1
								printf "\nSorry you don't have anymore reroll chances you have to keep your roll"
							elif [[ $rerollchances -gt 0 ]]; then
								sleep 1
								printf "\nYou have used up one of your reroll chances"
								responseRoll=$(( $RANDOM % 20 +1 ))
								printf "\nYou have reolled $responseRoll\n"
							break 2
							fi
							;;
						esac
					done
				done
			# if statment for win or loss
			if [[ $responseRoll -ge $challengeRoll ]]; then
				printf "You made the correct judgement on this transit"
				((score++))
			else
				printf "You made a poor judgement on this transit"
			fi
		done
	if [[ $score -gt 8 ]]; then
		printf "\n\nYour score is $score\nYou Passed this challenge! Congrats!"
	elif [[ $score -gt 5 && $score -le 8 ]]; then 
		printf "\n\nYour score is $score\nYou may passed but poorly no benefits from this win."
	elif [[ $score -lt 5 ]]; then
		printf "\n\nYour score is $score\nYou have failed this challenge, there will be consequences"
	fi
}

# This is the function to create a random number to choose which document we are pulling from and then read that line

DocumentReader() {
# This creates a random number variable between 0-1 to choose which document
	shipchoice=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/Ship.txt) ))
	loadchoice=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/Supply.txt) ))
	clear 
	# This reads a line from the file depending on a random number based on the number of lines
	sed -n "${shipchoice}p" ~/Desktop/DND/Ship.txt
	sed -n "${loadchoice}p" ~/Desktop/DND/Supply.txt
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/Delivery.txt) )); sed -n "${rnd}p" ~/Desktop/DND/Delivery.txt
}

TMM

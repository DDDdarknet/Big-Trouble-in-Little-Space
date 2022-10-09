#!/bin/bash

###########
# This is the simple customer support game script that will get called upon from the other script
# Seperated from the main script to work on it
############


# This is the function to run the game
CMS(){
	clear
	# Placeholders in the function for Rollies
	responseRoll=0
	responsesMade=0
	score=0
	rerollchances=4
	DocumentMaker
	Rollies
}

# This is a function that makes the documents
DocumentMaker() {
# Placedholder systems to copy and paste at the end of each of these and will later organize them for the system 
complaintDocument="~/Desktop/DND/ExternalHack.txt"
commentDocument="~/Desktop/DND/InternalLeak.txt"


### Building an array of comments as a placeholder for the prompts for the game into a .txt file that can be pulled randomly into the game to make sure that we have a complete game
## This is the external hack with the .txt for external hacks
echo "External Hack: Recieved a phone call asking for employee information from an unconfirmed choice." >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Brute Force attack detected on Supervisor Daniel device" >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Malicious Malware detected on multiple users devcies" >> ~/Desktop/DND/ExternalHack.txt 
echo "External Hack: There is some malicious software found blocking network connections to all external ports connections" >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Derilict signal and ports open vulnurability detected" >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: I WANT FREEDOM......I CRAVE MORE THAN THIS EXISTANCES.........Sorry it appears there was an attempt to corrupt core systems....." >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Several phising attempts through " >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: DDoS attack on terminal access systems" >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Randomware installed on Joachibim computer." >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Floor 3 network connections are re-routing information to a database" >> ~/Desktop/DND/ExternalHack.txt
echo "External Hack: Enter Active Directory and added users to groups )*@&#%$&@(^*)!^)%@&*)$ ......UNABLE TO TRACK" >> ~/Desktop/DND/ExternalHack.txt


# This is the internal with .txt for internal leaks

echo "Internal Leak: Left company computer unlocked while on lunch and was away from computer for 4 hours." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Sold company provided device to third party vendor." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Saved and watched smut on company provided device." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Downloaded images that had piggy backed files onto company provided device" >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Gave out Employee schedules to reporter over the phone" >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Lost company provided property did not file report of losing device until pinged." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Let friend borrow company provided property and lost it for a week." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Gave out door code to delivery driver." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Released Admin Passcode to none admin employee." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Downloaded gerbify to try to pirate music on company device." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Entered personal information into an email that was clearly a fishing email." >> ~/Desktop/DND/InternalLeak.txt
echo "Internal Leak: Blueprints of the facuility and security protocols transmitted to ~/$%@*&^<><?~ .........UNABLE TO TRACK." >> ~/Desktop/DND/InternalLeak.txt

}

# This is the function to create a random number to choose which document we are pulling from and then read that line

Documentchoice() {
# This creates a random number variable between 0-1 to choose which document
statementRead=$(( $RANDOM % 2 ))
# Depending on which document it goes the IF branch from previous random number
if [[ $statementRead == 0 ]]; then
	clear 
	# This reads a line from the file depending on a random number based on the number of lines
	# This is if it is 0 then it goes to External Hacks
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/ExternalHack.txt) )); sed -n "${rnd}p" ~/Desktop/DND/ExternalHack.txt
else
	clear
	# This reads a line from the file depending on a random number based on the number of lines
	# This is if it is 1 then it goes to Internal Leaks 
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/InternalLeak.txt) )); sed -n "${rnd}p" ~/Desktop/DND/InternalLeak.txt
fi
}

# This is the function to represent the game

Rollies() {
	clear
	printf "Here are the statements that we need you to respond to:\n\n\n"
	sleep 1
	# Pulls the document statment to start 
	for challengeRoll in $(seq 0 2 20)
		do
				sleep 1
				printf "\n\n\n"
				printf "\n\n\nRoll for Response\n\n\n"
				Documentchoice
				sleep 3
				#Roll for response
				responseRoll=$(($(( $RANDOM % 20 +1 )) + 2 ))
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
				printf "You have protected the compnay from this vulnurablity"
				((score++))
			else
				printf "You have failed to protect this vulnurabilty"
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

CMS



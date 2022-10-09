#!/bin/bash

###########
# This is the simple customer support game script that will get called upon from the other script
# Seperated from the main script to work on it
############


# This is the function to run the game
SWQ(){
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
Document="~/Desktop/DND/WorthianQuestion.txt"
commentDocument="~/Desktop/DND/WorthianCulture.txt"


### Building an array of comments as a placeholder for the prompts for the game into a .txt file that can be pulled randomly into the game to make sure that we have a complete game
## This is the complaint section with the .txt for complaints
echo "I have to ask your people don't use machines, and yet you have a cyber suit? Where did you find it who wore it? How did you get it?">> ~/Desktop/DND/WorthianQuestion.txt
echo "Worthians don't usually ever travel the space? What brought you out here? " >> ~/Desktop/DND/WorthianQuestion.txt
echo "Did you hear about the other Worthians that are roaming the system recently? Are they members of your tribe?" >> ~/Desktop/DND/WorthianQuestion.txt
echo "What does your name mean to you? How is life outside treating you?" >> ~/Desktop/DND/WorthianQuestion.txt
echo "How do people feel around you? Do you trust your companions? Are they just there for your benefit?" >> ~/Desktop/DND/WorthianQuestion.txt
echo "Why am I so curious about you....a Worthian outside in space absloutely facicinating the only records of your people are the worlds and the few colonies that you explore but your people never leave....I wonder why there are so many flying around recently... " >> ~/Desktop/DND/WorthianQuestion.txt


# This is the comment section with .txt for comments

echo "Did you know from what I have read the Worthians have a leader who has the ability to force his people to listen to them and control them?" >> ~/Desktop/DND/WorthianCulture.txt
echo "I hear that there are cultures of Worthians that enjoy eating the flesh of others is that true?" >> ~/Desktop/DND/WorthianCulture.txt
echo "There appears to be a species that can dominate the minds of others similar to the Worthians and can dominate many races do you think the adapted from Worthians?" >> ~/Desktop/DND/WorthianCulture.txt
echo "I wonder what happens if two different races with the ability for mind control battle on the mind who do you think would win?" >> ~/Desktop/DND/WorthianCulture.txt
echo "Why is it that the Worthians don't like technology? Do you think it is a fear of what it might do to them? Or something else?" >> ~/Desktop/DND/WorthianCulture.txt
echo "I have so many questions but it will have to wait for a later time. I have so many questions." >> ~/Desktop/DND/WorthianCulture.txt

}

# This is the function to create a random number to choose which document we are pulling from and then read that line

Documentchoice() {
# This creates a random number variable between 0-1 to choose which document
statementRead=$(( $RANDOM % 2 ))
# Depending on which document it goes the IF branch from previous random number
if [[ $statementRead == 0 ]]; then
	clear 
	# This reads a line from the file depending on a random number based on the number of lines
	# This is if it is 0 then it goes to customer complaints
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/WorthianQuestion.txt) )); sed -n "${rnd}p" ~/Desktop/DND/WorthianQuestion.txt
else
	clear
	# This reads a line from the file depending on a random number based on the number of lines
	# This is if it is 1 then it goes to customer comments 
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/WorthianCulture.txt) )); sed -n "${rnd}p" ~/Desktop/DND/WorthianCulture.txt
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
				printf "You answered the A.I. question favorably"
				((score++))
			else
				printf "You answered the A.I. question negatively"
			fi
		done
	if [[ $score -gt 7 ]]; then
		printf "\n\nYour score is $score\nYou Passed this challenge! Congrats!"
	elif [[ $score -gt 4 && $score -le 7 ]]; then 
		printf "\n\nYour score is $score\nYou may passed but poorly no benefits from this win."
	elif [[ $score -lt 4 ]]; then
		printf "\n\nYour score is $score\nYou have failed this challenge, there will be consequences"
	fi
}

SWQ



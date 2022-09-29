#!/bin/bash

###########
# This is the simple customer support game script that will get called upon from the other script
# Seperated from the main script to work on it
############


# This is the function to run the game
CSS(){
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
complaintDocument="~/Desktop/DND/CustomerComplaints.txt"
commentDocument="~/Desktop/DND/CustomerComments.txt"


### Building an array of comments as a placeholder for the prompts for the game into a .txt file that can be pulled randomly into the game to make sure that we have a complete game
## This is the complaint section with the .txt for complaints
echo "Customer Complaint: My cargo was short over 5 tons, and the only place it could have gone missing I want a refund" >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: My delivery was late by 3 solar cycles, I needed it for a wedding and now it is useless what do you plan to do?" >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: My dog died 3 months ago, I order a casket and some make up so I could dress my dog up but when I got my order it was the wrong color, so I had to return it but now when I got the replacement one it is still the wrong color. I'm just so sad and I just need the right color can't you help me?" >> ~/Desktop/DND/CustomerComplaints.txt 
echo "Customer Complaint: You guys suck, why don't you offer free shipping all the time, its bullshit that I gotta pay for the subscription. You guys can suck my nuts." >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: I'm never getting my shipping done by y'all, lousy no good, dirty ass capitalist scum, and boy golly I hope y'all rot in hell." >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: I seem to have a delay in one of my shipments I have the tracking number its A55H0L3, I just wanted an update on when it would arrive?" >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: You don't seem to care for the customer when it comes to quality and speed, you be taking forever to deliver and then they just drop it from orbit! You know the mess that makes? You sicken me! " >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: Y'all my package was dropped from orbit and landed on some gas tanks and it BLEW UP! THIS IS RIDCILIOUS! WHAT KIND OF DELIVERY IS THIS!?!" >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: I got the notice that my package was delvered and the photo showed that it was delvered next my refinery, but there was nothing, no Llyodium, no crate, no titanium, NOTHING! DID YOU STEAL MY PACKAGE!? " >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: I just watched the most elobrate heist of a package from my satalitte camera. Y'all dropped off the package which thank you for that, but then almost as if planned ahead of time another ship flew down grabbed my package and flew away. They stole my package soooooooo can I can a free replacement? Compensation? Something?" >> ~/Desktop/DND/CustomerComplaints.txt
echo "Customer Complaint: THEY ARE COMING TO DO A DIE HARD! THIS IS A DIE HARD SITUATION I REPEAT A DIE HARD SITUATION IS A AFOOT!!" >> ~/Desktop/DND/CustomerComplaints.txt


# This is the comment section with .txt for comments

echo "Customer Comment: Its a delivery choice, would I have prefered local? Sure, but you have squeezed out all the competition...so thanks for that I guess... " >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: While you guys have grown you have made it harder and harder to really love you, but GD did you deliver." >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: I'm pooping at this moment, and figured I would leave a comment on my delivery. Not the best time, but you know faster than expected." >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: I was getting the pipe for the first time in a long while and lets just say delivery driver delivered" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: As a Porch Pirate, really made it easy to order and rob a couple people keep it up!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: I'VE BEEN STUCK IN THE WALLS OF THE STATION! HELP ME IDK HOW YOU GET THESE PISS BOTTLES DELIVERED BUT I CAN'T GET OUT!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: I really wanted to let y'all know I'm a little confused at how your CEO hasn't been seen but thats why I spend so much with y'all I wanna know the SECRETS!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: Galactic Operations and Ventures Technology, you really outdid yourselves with the home brand, it SLAPS!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: I really can't wait for y'all to start selling ships, like I can see you guys getting there and I wanna buy them from y'all NEVER HAD A COMPLAINT IN MY LIFE!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: You guys have the best programing, the best subscription, the best goods, the best delivery, and the best customer service!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: I WANNA WORK FOR YOU PLEASE HIRE ME! PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE!!!!" >> ~/Desktop/DND/CustomerComments.txt
echo "Customer Comment: THIS IS A DIE HARD SITUATION!! RED ALERT THEY ARE INSIDE THE STATION! THIS IS A DIE HARD SITUATION!! SOUND THE ALARM SOMETHING! I CAN'T STOP THEM! NEED ASSISTANCE!" >> ~/Desktop/DND/CustomerComments.txt

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
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/CustomerComplaints.txt) )); sed -n "${rnd}p" ~/Desktop/DND/CustomerComplaints.txt
else
	clear
	# This reads a line from the file depending on a random number based on the number of lines
	# This is if it is 1 then it goes to customer comments 
	rnd=$(( 1 + $RANDOM % $(wc -l < ~/Desktop/DND/CustomerComments.txt) )); sed -n "${rnd}p" ~/Desktop/DND/CustomerComments.txt
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
				printf "You made a correct response to this statement"
				((score++))
			else
				printf "You made a poor response to this statement"
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

CSS



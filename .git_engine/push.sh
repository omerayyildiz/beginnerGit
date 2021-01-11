#!/bin/bash
yellow=`tput setaf 3`
blue=`tput setaf 4`
red=`tput setaf 1`
cyan=`tput setaf 6`
magenta=`tput setaf 5`
reset=`tput sgr0`

drawLine (){
    for (( i=1; i<=40; i++ ))
    do  
        printf "-"
    done
}

semanticCommit (){
      COMMIT_MSG="$1"   
      if [[ ${COMMIT_MSG: -1} == '.' ]];then
        let "MSG_LENGTH=${#COMMIT_MSG}-1"
        COMMIT_MSG="$(echo ${COMMIT_MSG:0: $MSG_LENGTH})"
      fi     
}

while [[ $SELECTION != 1 && $SELECTION != 2 && $SELECTION != 3 && $SELECTION != 4 ]]
do

printf "${yellow}1. Adding something\n${reset}"
printf "${yellow}2. Deleting folder or file\n${reset}"
printf "${yellow}3. Fixing bug\n"
printf "${yellow}4. New feature\n"
printf "${yellow}5. Editing docs\n"
printf "${yellow}6. Refactoring\n"
printf "${yellow}7. Testing\n"
printf "${yellow}8. Chore tasks\n"
printf "${yellow}$(drawLine)\n${reset}"

read -p "${yellow}What kind of change did you make?:${reset}" SELECTION
    
    if [[ $SELECTION == 1 ]]; then
        COMMIT_HEADER="add:"

        elif [[ $SELECTION == 2 ]]; then
            COMMIT_HEADER="delete:"

        elif [[ $SELECTION == 3 ]]; then
            COMMIT_HEADER="fix:"

        elif [[ $SELECTION == 4 ]]; then
            COMMIT_HEADER="feat:"

        elif [[ $SELECTION == 5 ]]; then
            COMMIT_HEADER="docs:"

        elif [[ $SELECTION == 6 ]]; then
            COMMIT_HEADER="refactor:"

        elif [[ $SELECTION == 7 ]]; then
            COMMIT_HEADER="test:"

        elif [[ $SELECTION == 8 ]]; then
            COMMIT_HEADER="chore:"
    
        else
            echo "Please enter a number up to eight!"
            sleep 1 && clear
        fi
done

clear && read -p "${cyan}What did you do?:${reset}" COMMIT_MSG
semanticCommit "${COMMIT_MSG}"
COMMIT="${COMMIT_HEADER} ${COMMIT_MSG}"

clear && echo "${yellow}Successful!${reset}"
sleep 1 && clear

cd ..
git add .
git commit -m "$COMMIT"
git push
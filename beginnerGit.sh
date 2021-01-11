#!/bin/bash
yellow=`tput setaf 3`
blue=`tput setaf 4`
red=`tput setaf 1`
cyan=`tput setaf 6`
magenta=`tput setaf 5`
reset=`tput sgr0`
export NAME="Ömer"

drawLine (){
    for (( i=1; i<=40; i++ ))
    do  
        printf "-"
    done
}

cd .git_engine/
echo "${yellow}Hello, ${NAME}!${reset}"
sleep 1 && clear

while [[ $BRANCHING != 1 && $BRANCHING != 2 && $BRANCHING != 3 ]]
do

printf "${cyan}1. Pull Changes\n2. Commit New Changes\n${red}3. Print Log${reset}\n$(drawLine)\n${reset}"
read -p "${cyan}What you wanna do?:${reset}" BRANCHING
    
    if [[ $BRANCHING == 1 ]]; then
        clear && bash sync.sh

    elif [[ $BRANCHING == 2 ]]; then
        clear && bash push.sh

    elif [[ $BRANCHING == 3 ]]; then
        clear && git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
  
    else
        echo "Please, input only 1 or 2!"
        sleep 2 && clear
    
    fi
done
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

cd .git_engine/

while [[ $BRANCHING -lt 1 || $BRANCHING -gt 3 ]]; do

printf "${cyan}1. Pull Changes\n2. Commit New Changes\n${red}3. Print Log${reset}\n$(drawLine)\n${reset}"
read -p "${cyan}What you wanna do?:${reset}" BRANCHING

    if [[ $BRANCHING == 1 ]]; then
        clear && bash sync.sh

        elif [[ $BRANCHING == 2 ]]; then
            clear && bash push.sh

        elif [[ $BRANCHING == 3 ]]; then
            clear && git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

        else
            echo "Please, input only 1, 2 or 3!"
            sleep 1 && clear
    fi
done

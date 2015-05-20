#!/bin/bash

#Colors
RED='\033[0;31m'
NC='\033[0m'

printf "${RED}Osu! Linux installation tool by Luky${NC}\n"

	function installprerequisites() {
		command -v wine > /dev/null && { printf "Wine is already installed\n"; } || { sudo apt-get install wine; }
		command -v winetricks > /dev/null && { printf "Winetricks is already installed\n"; } || { sudo apt-get install winetricks; }
}

	function makeprefix() {
		WINEARCH=win32 winecfg
}
            
	function installosuprerequisites() {
		winetricks dotnet20
}

	function installosu() {
		wget "http://m1.ppy.sh/r/osu!install.exe"
		wine osu!install.exe
}

PS3='Please enter your choice: '
options=("Install Wine and Winetricks" "Make a 32bit prefix" "Install OSU! Prerequisites trough winetricks" "Install OSU!" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wine and Winetricks")
            printf "${RED}Make sure you have backupped the old .wine folder ${NC}\n"
	    installprerequisites
            ;;
        "Make a 32bit prefix")
	    makeprefix
            ;;
        "Install OSU! Prerequisites trough winetricks")
	    installosuprerequisites
            printf "${RED}Osu! Linux installation tool by Luky${NC}\n"
            ;;
        "Install OSU!")
	    installosu
            printf "${RED}In case you have some problems, make sure you've installed the prerequisites${NC}\n"
            ;;
        "Quit")
            exit 0
            ;;
        *) echo invalid option;;
    esac
done

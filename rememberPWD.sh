#! /bin/bash
# Coded by BashSTuff 
# Ver1.0
##################################################################################
###                         Remember PWD		                               ###
##################################################################################
# 
# Script puts PWD into a file and sets it when starting another bash session as that user   
# Created this because I was tried of having to cd into previous PWD when openning another shell (esp having to use sudo on Debian distros).
#
##


if [ ! -f ~/.bashrc ]; then # edit location of bashRC file if located somewhere else
	echo -e "\nThis script edits the bashrc file. None was found in the typical location.\n"

elif [ -f ~/.bashrc ]; then
	echo "Making backup for BASHRC file..."
	mv -v ~/.bashrc ~/.bashrc-BACKUP
	echo -e '\n\n' >> ~/.bashrc-BACKUP
	echo -e "# save PWD to disk\nfunction cd {\n    builtin cd \"\$@\"\n    echo \$PWD > ~/.previousPWD\n}\ncd \"\`cat ~/.previousPWD\`\"" >> ~/.bashrc-BACKUP # setting up function here
	echo "setting new BASHRC file"
	cp -v ~/.bashrc-BACKUP ~/.bashrc
	echo "DONE!"

else
	echo "Error somewhere in script"

fi


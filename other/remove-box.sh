#!/bin/bash

delete_box()
{
        rm -rf ~/Homestead56
        vagrant global-status --prune
        VBoxManage controlvm homestead-56 poweroff
        VBoxManage unregistervm homestead-56 --delete
        echo "Deleted box! Now remove ~/.homestead-56 to remove previous sites if you like..."
        exit 0
}

read -p "Are you sure you want to continue? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
	delete_box
else
  exit 0
fi

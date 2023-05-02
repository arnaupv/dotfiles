#!/bin/bash

DRY=false

# function for priting or executing the command in dry mode
# if the first argument is true, the command is executed
# otherwise it is printed
function drymode {
	if [ $DRY = true ]; then
		echo $@
	else
		$@
	fi
}

# Create a function that accepts 2 arguments
# 1st argument is the input folder containing the folders to be linked
# 2nd argument is the folder when the symbolic links will be
# inside the input_folder hidden folders are also covered by the symlink
# returning no symlink in case there is no folders in the input_folder
function create_symlinks {
	input_folder=$1
	output_folder=$2
	if [ -n "$(ls -A $input_folder)" ]; then
		for folder in $input_folder/* $input_folder/.[a-zA-Z0-9]*; do
			# remove the symlink if it already exists
			folder_name=$(basename $folder)
			target_output_folder=$output_folder/$folder_name
			if [ -L "$output_folder/$folder_name" ]; then
				echo "Removing symlink $target_output_folder"
				drymode rm $target_output_folder
			fi

			if [ -e $folder ]; then
				echo -e "-> creating symlink ${target_output_folder} \n"
				drymode ln -s $folder $target_output_folder
			fi
		done
	fi
}

# mapping of the folders to be linked (input_folder, output_folder)
# ${HOME}/dotfiles/local ${HOME}/.local
# ${HOME}/dotfiles/home ${HOME}
# ${HOME}/dotfiles/config ${HOME}/.config
mapping=(
	"${HOME}/dotfiles/local ${HOME}/.local"
	"${HOME}/dotfiles/home ${HOME}"
	"${HOME}/dotfiles/config ${HOME}/.config"
)

for map in "${mapping[@]}"; do
	input_folder=$(echo $map | cut -d' ' -f1)
	output_folder=$(echo $map | cut -d' ' -f2)
	create_symlinks $input_folder $output_folder
done

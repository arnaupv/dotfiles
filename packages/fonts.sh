#!/bin/sh

MY_USER=$(ls /home/ | head -n1)
MY_HOME="/home/${MY_USER}"

num_of_fonts=$(ls -l "${MY_HOME}"/.local/share/fonts/* | wc -l)
if [ "${num_of_fonts}" -lt 10 ]; then
	su "${MY_USER}" -c sh -c "$(git clone https://github.com/powerline/fonts.git --depth=1 && cd ./fonts && ./install.sh && cd .. && rm -rf fonts)"
fi

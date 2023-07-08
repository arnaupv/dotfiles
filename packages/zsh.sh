#!/bin/sh
if [ ! -d "${MY_HOME}"/.oh-my-zsh/ ]; then
	sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"
fi

#!/bin/bash
set -xe

# Unlink all dotfiles
stow --dir="$HOME"/dotfiles/dotfiles/ --target="$HOME" --verbose -D .

# Link dotfiles again
stow --dir="$HOME"/dotfiles/dotfiles/ --target="$HOME" --verbose .

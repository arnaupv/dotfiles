#!/bin/sh

set -ex

MY_USER=$(ls /home/ | head -n1)
MY_HOME="/home/${MY_USER}"

apt-get update

# Rust
if [ ! -d "${MY_HOME}/.cargo/" ]; then
	su "${MY_USER}" -c sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)"
	rustup override set stable
	rustup update stable
fi

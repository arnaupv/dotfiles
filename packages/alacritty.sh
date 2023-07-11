#!/bin/sh

sh ./rust.sh

apt update
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 git

git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
cargo build --release --no-default-features --features="${XDG_SESSION_TYPE}"

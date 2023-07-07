#!/bin/sh

apt-get update
apt-get install -y curl wget
curl -sL https://deb.nodesource.com/setup_18.x | bash -

apt-get update
apt-get install -y nodejs

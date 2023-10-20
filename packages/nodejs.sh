#!/bin/sh

# Instructions
# https://github.com/nodesource/distributions#installation-instructions

# Pinning Found in https://github.com/nodesource/distributions/issues/1579
echo "Package: nodejs" >> /etc/apt/preferences.d/preferences && \
echo "Pin: origin deb.nodesource.com" >> /etc/apt/preferences.d/preferences && \
echo "Pin-Priority: 1001" >> /etc/apt/preferences.d/preferences

apt-get update
apt-get install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpgkey

# Let's udpate to NODE_MAJOR=20 when the issue is resolved https://github.com/nodesource/distributions/issues/1688
NODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

apt-get update
apt-get install nodejs -y

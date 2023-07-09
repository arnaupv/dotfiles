# Setup Environment

Instructions needed for setting up my environment (based on Ubuntu 20).
These are the default instructions used to setup the devcontainer in the followingn nvim plugin: [nvim-devcontainer-cli](https://github.com/arnaupv/nvim-devcontainer-cli)

## Installation

If you need to start from scratch first you will need to install
git for cloning the current repo.

_Ubuntu_

```bash
sudo apt update
sudo apt install git
```

and then clone the project:

```bash
git clone https://github.com/arnaupv/dotfiles.git ${HOME}/dotfiles
```

Finally install the pacakges and the dotfiles:

```bash
cd ${HOME}/dotfiles; ./install.sh
```

# dotfiles

My dotfiles, currently managed by nix.

## Install

#### Install Homebrew

Follow instructions from https://brew.sh/. On an M1 mac, Homebrew installs to `/opt/homebrew/`.

#### Install nix (daemon mode): 

```sh
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon
```

#### Install nix-darwin:

```sh
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```
        
#### Add home-manager and unstable channel 

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --update
```

#### Link Darwin configuration

```sh
ln -s $(pwd)/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix
```

#### Build

```sh
darwin-rebuild switch
```

## Making updates

Make the update, then run `darwin-rebuild switch`.

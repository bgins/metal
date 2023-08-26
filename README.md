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

## Adding software

Add a package to `home.nix` or `homebrew.nix`, then run `darwin-rebuild switch`

## Updating the system

The following commands update the channels and rebuild the system:

```
nix-channel --update
sudo -i nix-channel --update
darwin-rebuild switch
```

## Upgrading channels

Channels are updated withs stable releases every six months. They need to be updated for the system, darwin, and home-manager.

For example, updating the channels to 23.05 would include:

```
sudo -i nix-channel --add https://nixos.org/channels/nixpkgs-23.05-darwin nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --add https://github.com/LnL7/nix-darwin/archive/release-23.05.tar.gz darwin
```

Make sure to update these all at the same time when a new stable relase arrives.

Then run:

```
sudo -i nix-channel --update
nix-channel --update
darwin-rebuild switch
```
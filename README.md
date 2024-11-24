# dotfiles

My dotfiles, currently managed by nix.

## Install

#### Install Homebrew

Follow instructions from https://brew.sh/. On an M1 mac, Homebrew installs to `/opt/homebrew/`.

#### Install nix (daemon mode):

Use the Determinate Systems installer:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

See https://victorpierre.dev/blog/declarative-macos-configurations-with-nix/ for more details.

## Apply configuration

Run this command when first applying the configuration:

```sh
nix run nix-darwin -- switch --flake .
```

## Updating the system

The following commands update the channels and rebuild the system:

```sh
nix flake update
darwin-rebuild switch --flake .
```

## Garbage collection

Garbage collection happens automatically, but can be run manually by removing older generations (older than 30d here) the garbage collection:

```
nix-env --delete-generations 30d
nix-store --gc
```

See https://nixos.org/manual/nix/unstable/package-management/garbage-collection.html for more options.

## Upgrading channels

TODO: Check on the details of this section. We may update these through code with the shift to flakes.

Channels are updated withs stable releases every six months. They need to be updated for the system, darwin, and home-manager.

For example, updating the channels to 23.05 would include:

```
sudo -i nix-channel --add  https://nixos.org/channels/nixpkgs-23.05-darwin nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
```

Note that nix-darwin does not currently support stable releases, but they are considering it for the future.

Make sure to update these all at the same time when a new stable relase arrives.

Then run:

```
sudo -i nix-channel --update
nix-channel --update
darwin-rebuild switch
```

## Notes

In this setup, the nix binary is managed at the system level and is updated through the `nixpkgs` channel.

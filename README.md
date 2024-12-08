# metal

My machines, managed by nix.

## Install

#### Install Homebrew

Follow instructions on [https://brew.sh/](https://brew.sh/). On Apple Silicon, Homebrew installs to `/opt/homebrew/`.

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

## Channels

Channels are managed in [`flake.nix`](./flake.nix). Currently running on unstable, but a stable channel could be set here.

## Garbage collection

Garbage collection happens automatically, but can be run manually by removing older generations (older than 30d here) the garbage collection:

```
nix-env --delete-generations 30d
nix-store --gc
```

See https://nixos.org/manual/nix/unstable/package-management/garbage-collection.html for more options.

{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ./homebrew.nix ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
   [ pkgs.vim
   ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    trustedUsers = ["root" "@wheel"];
    trustedBinaryCaches = [
      "https://cache.nixos.org"
      "https://hydra.iohk.io"
      "https://static-haskell-nix.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "static-haskell-nix.cachix.org-1:Q17HawmAwaM1/BfIxaEDKAxwTOyRVhPG5Ji9K3+FvUU="
    ];

    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  programs = {
    zsh = {
      enable = true;
      promptInit = "";
    };
  };

  services.lorri.enable = true;

  users.users.brian = {
    home = "/Users/brian";
    shell = pkgs.zsh;
  };
  home-manager.users.brian = import ./home.nix;

  # system = {
  #   defaults = {
  #     dock = {
  #       autohide = true;
  #       orientation = "bottom";
  #     };
  #   };
  # };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}


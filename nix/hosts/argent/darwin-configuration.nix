{ pkgs, ... }:
{
  imports = [
    ./homebrew.nix

    ../../modules/base/darwin.nix
  ];

  environment.systemPackages = [
    pkgs.vim
  ];

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
      };
    };
  };
}

{ pkgs, ... }:
{
  imports = [
    ./homebrew.nix

    ../../modules/base/darwin.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

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

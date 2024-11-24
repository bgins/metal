{ lib, pkgs, ... }:

{
  users.users.brian = {
    home = if pkgs.stdenv.isDarwin then "/Users/brian" else "/home/brian";
    shell = pkgs.zsh;
    # Authorized keys for future server use
    # openssh.authorizedKeys.keys = [
    # ];
  };
  users.groups.brian = { };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.brian = import ./home.nix;
  };
}

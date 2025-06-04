{ pkgs, ... }:
{
  imports = [
    ./homebrew.nix

    ../../modules/base/darwin.nix
  ];

  environment.systemPackages = [
    pkgs.vim
  ];

  # TODO We probably need to reinstall nix entirely.
  #
  # Original error message:
  # -----------
  # error: Build user group has mismatching GID, aborting activation
  # The default Nix build user group ID was changed from 30000 to 350.
  # You are currently managing Nix build users with nix-darwin, but your
  # nixbld group has GID 30000, whereas we expected 350.

  # Possible causes include setting up a new Nix installation with an
  # existing nix-darwin configuration, setting up a new nix-darwin
  # installation with an existing Nix installation, or manually increasing
  # your `system.stateVersion` setting.

  # You can set the configured group ID to match the actual value:

  #     ids.gids.nixbld = 30000;

  # We do not recommend trying to change the group ID with macOS user
  # management tools without a complete uninstallation and reinstallation
  # of Nix.
  # -------
  ids.gids.nixbld = 30000;

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
      };
    };
  };
}

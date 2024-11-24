_:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    gc = {
      automatic = true;
    };
  };

  programs.zsh.enable = true;
}

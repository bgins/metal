{ ... }: {

  imports = [ ./common.nix ../../users ];

  nix = {
    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

    gc = {
      interval = {
        Hour = 3;
        Minute = 16;
        Weekday = 6;
      };
      options = "--delete-older-than 30d";
    };
    settings = {
      trusted-users = [ "root" "@admin" ];
    };
  };

  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    global = {
      brewfile = true;
      lockfiles = false;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };

  system.stateVersion = 5;
}

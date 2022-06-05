{ config, lib, pkgs, ...}:

{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    autoUpdate = true;
    cleanup = "zap";
    global = {
      brewfile = true;
      noLock = true;
    };

    brews = [ 
      "awscli"
      "deno"
      "fission-cli" 
      "vips"
    ];

    taps = [
      "fission-suite/fission"
      "homebrew/cask"
      "homebrew/cask-versions"
    ];

    casks = [
      "adobe-acrobat-reader"
      "balenaetcher"
      "bettertouchtool"
      "brave-browser"
      "cleanshot"
      "db-browser-for-sqlite"
      "discord"
      "firefox"
      "firefox-developer-edition"
      "figma"
      "gimp"
      "google-chrome"
      "gpg-suite"
      "handbrake"
      "iterm2"
      "logseq"
      "nextcloud"
      "obs"
      "raycast"
      "sublime-text"
      "visual-studio-code"
      "vlc"
      "zoom"
    ];
  };
}


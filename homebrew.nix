{ config, lib, pkgs, ...}:

{
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    global = {
      brewfile = true;
      lockfiles = false;
    };

    brews = [ 
      "awscli"
      "cmake"
      "deno"
      "fission-cli" 
      "go"
      "sevenzip"
      "vips"
      "wasm-tools"
    ];

    taps = [
      "fission-suite/fission"
      "homebrew/cask-versions"
    ];

    casks = [
      "adobe-acrobat-reader"
      "arc"
      "balenaetcher"
      "bettertouchtool"
      "blackhole-16ch"
      "brave-browser"
      "cleanshot"
      "db-browser-for-sqlite"
      "discord"
      "firefox"
      "firefox-developer-edition"
      "figma"
      "gimp"
      "gpg-suite"
      "handbrake"
      "inkscape"
      "insomnia"
      "iterm2"
      "libreoffice"
      "logseq"
      "maccy"
      "midiview"
      "nextcloud"
      "obs"
      "pop"
      "raycast"
      "steam"
      "sublime-text"
      "visual-studio-code"
      "vlc"
      "zoom"
    ];
  };
}


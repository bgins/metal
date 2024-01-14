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
      "vips"
      "wasm-tools"
      "wasmtime"
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
      "blackhole-16ch"
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


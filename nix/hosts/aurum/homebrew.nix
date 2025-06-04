_:

{
  homebrew = {
    taps = [
      "1password/tap"
      "dopplerhq/cli"
      "probe-rs/probe-rs"
    ];

    brews = [
      "arm-none-eabi-gdb"
      "awscli"
      "cloudflared"
      "cmake"
      "deno"
      "doppler"
      "gcc"
      "gh"
      "gsed"
      "ipfs"
      "lsusb"
      "minicom"
      "opentofu"
      "pnpm"
      "pre-commit"
      "probe-rs"
      "sevenzip"
      "ripgrep"
      "wasm-tools"
      "websocat"
    ];

    casks = [
      "1password"
      "1password-cli"
      "adobe-acrobat-reader"
      "arc"
      "balenaetcher"
      "bettertouchtool"
      # "blackhole-16ch" # has issues on macOS Sequoia, even uninstalling has issues
      "brave-browser"
      "cleanshot"
      "db-browser-for-sqlite"
      "discord"
      "docker"
      "firefox"
      "ghostty"
      "gimp"
      "gpg-suite"
      "google-chrome"
      "handbrake"
      "inkscape"
      "insomnia"
      "iterm2"
      "libreoffice"
      "logseq"
      "maccy"
      "microsoft-edge"
      "obs"
      "ollama"
      "orion"
      "pgadmin4"
      "pop"
      "raycast"
      "steam"
      "sublime-text"
      "visual-studio-code"
      "vlc"
      "zed@preview"
      "zoom"
    ];
  };
}

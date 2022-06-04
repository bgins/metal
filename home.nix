{ config, pkgs, ... }:


let
  unstable = import <unstable> {};
in {

  programs.home-manager.enable = true;

  home.sessionPath = [
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
  ];

  home.packages = with pkgs; [
    coreutils
    cmake
    # docker
    direnv
    git
    inetutils
    jq
    speedtest-cli
    wget

    # Process
    htop

    # Filesystem
    fd
    ripgrep
    tree

    # Databases
    sqlite

    # Fonts
    fira-code
    nerdfonts

    # Haskell
    ghc
    stack

    # Rust
    rustup

    # Build
    just

    # Image processing
    # vips

    # Web
    nodejs-18_x
    yarn
  ];

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "ssh-agent"
        ];
      };
      sessionVariables = { 
        EDITOR = "vim"; 
        NVM_DIR = "$HOME/.nvm";
      };
      shellAliases = { 
        ls = "ls --color=always";
        cpwd = "echo pwd | pbcopy";
      };
       initExtra = (''
         export NIX_PATH=darwin-config=/Users/brian/.nixpkgs/darwin-configuration.nix:/nix/var/nix/profiles/per-user/root/channels:/Users/brian/.nix-defexpr/channels:/Users/brian/.nix-defexpr/channels

         [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
         [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      '');
    };

    git = {
      enable = true;
      userName = "Brian Ginsburg";
      userEmail = "gins@brianginsburg.com";

      extraConfig = {
        github.user = "bgins";
        init.defaultBranch = "main";
      };

      signing = {
        key = "B7A01B90EB115B2D";
        signByDefault = true;
      };
    };

    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        character = {
          success_symbol = "[»](green) ";
          error_symbol = "[✗](red) ";
        };
        directory = {
          fish_style_pwd_dir_length = 1;
          truncation_length = 1;
        };
        hostname = {
          ssh_only = true;
          format = "[$hostname]($style):";
        };
        username = { 
          format = "[$user]($style) "; 
          show_always = false;
        };
        # line_break = { disabled = true; };
        cmd_duration = { disabled = true; };
        nodejs = { disabled = true; };
        package = { disabled = true; };
        aws = { disabled = true; };
      };
    };
    
    vim = {
      enable = true;
      extraConfig = builtins.readFile vim/vimrc;
    };

  };
}

{ config, pkgs, ... }: {

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    coreutils
    cmake
    # docker
    direnv
    git
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

    # Cloud
    # aws

    # Fonts
    fira-code
    nerdfonts

    # Haskell
    ghc
    stack

    # Rust
    # cargo
    # clippy
    # rustc
    rustup

    # Build
    just

    # Image processing
    # vips
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

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
    direnv
    git
    inetutils
    jq
    speedtest-cli
    wget

    # Machine
    ansible
    # docker

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
      };
      shellAliases = { 
        ls = "ls --color=always";
        cpwd = "echo pwd | pbcopy";
        update-servers = "ansible-playbook ~/code/system/servers/update-servers.yml -i ~/code/system/servers/hosts";
      };
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

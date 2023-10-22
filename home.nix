{ config, pkgs, ... }:


let
  unstable = import <unstable> {};
in {

  programs.home-manager.enable = true;

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
  ];

  home.packages = with pkgs; [
    btop
    coreutils
    direnv
    git
    inetutils
    jq
    htop
    mkcert
    nmap
    speedtest-cli
    tmux
    wget

    # Filesystem
    fd
    ripgrep
    tree

    # Database
    sqlite

    # Languages
    ghc
    rustup
    stack

    # Fonts
    fira-code
    nerdfonts

    # Build Tools
    just

    # Machines
    ansible
    # docker

    # Web
    nodejs-18_x
    nodePackages.http-server
    w3m
    yarn

    # Audio
    ffmpeg
    # zynaddsubfx

    # Visual
    graphviz
  ];

  programs = {
    direnv.enable = true;
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
      initExtra = (''
        ssh-add --apple-use-keychain ~/.ssh/id_git_signing
        bindkey -v
      '');
    };

    git = {
      enable = true;
      userName = "Brian Ginsburg";
      userEmail = "gins@brianginsburg.com";

      extraConfig = {
        github.user = "bgins";
        gpg.format = "ssh";
        init.defaultBranch = "main";
      };

      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO18mEXCXNrqiCIbzSrR2Xfx7+L87oLiOh1jd7MRzG7I git signing key";
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
      plugins = [ pkgs.vimPlugins.vim-colorschemes ];
      settings = {
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        undodir = [ "~/.local/share/vim/undodir" ];
        undofile = true;
      };
    };

  };

  home.stateVersion = "23.05";
}

{ lib, pkgs, ... }: {
  home = {
    sessionPath = [
      "$HOME/.local/bin"
      "/opt/homebrew/bin"
      "$HOME/.cargo/bin"
      "$HOME/.go/bin" # Note: .go must be created manually for now
      "$HOME/.wasmtime/bin"
      "/usr/local/go/bin"
    ];

    packages = with pkgs; [
      btop
      direnv
      inetutils
      fd
      ffmpeg
      git
      graphviz
      jq
      mkcert
      nmap
      postgresql_16
      ripgrep
      speedtest-cli
      sqlite
      starship
      tmux
      tree
      w3m
      wget
      # zsh-forgit

      # Languages
      rustup

      # Fonts
      fira-code
      nerdfonts
    ];

    stateVersion = "24.05";
  };

  programs = {
    direnv.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "ssh-agent"
          "fzf"
          "git"
        ];
      };
      sessionVariables = {
        EDITOR = "vim";
        GOPATH = "$HOME/.go";
        WASMTIME_HOME= "$HOME/.wasmtime";
      };
      shellAliases = {
        ls = "ls --color=always";
        cpwd = "echo pwd | pbcopy";
      };
      initExtra = (''
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

        [ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

        ssh-add --apple-use-keychain ~/.ssh/id_git_signing
        bindkey -v
      '');
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      userName = "Brian Ginsburg";
      userEmail = "gins@brianginsburg.com";

      extraConfig = {
        github.user = "bgins";
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
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
}

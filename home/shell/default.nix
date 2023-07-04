{ config, pkgs, ... }:

{
  xdg.configFile = {
    zsh = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zsh/.config/zsh";
      recursive = true;
    };
    tmux = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/tmux/.config/tmux";
      recursive = true;
    };
  };    
  home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zsh/.zshrc";

  programs.starship = {
    enable = true;
    settings = {
      directory = {
        read_only = " ";
      };
      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
        vicmd_symbol = "[](bold green)";
      };
    };
  };

  home.packages = with pkgs; [
    exa
    fzf
    git
    starship
    tmux
    trash-cli
    unzip

    cargo
    gcc
    go
    jdk
    nodejs
  ];
}

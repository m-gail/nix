{ config, pkgs, hyprland, ... }:

{
  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

  imports = [
    hyprland.homeManagerModules.default
    ./shell
    ./neovim
    ./gui
  ];

  xdg.configFile = {
    awesome = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/awesome/.config/awesome";
      recursive = true;
    };
    bspwm = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/bspwm/.config/bspwm";
      recursive = true;
    };
    polybar = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/bspwm/.config/polybar";
      recursive = true;
    };
    sxhkd = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/bspwm/.config/sxhkd";
      recursive = true;
    };
  };
  

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = ''
    bind = SUPER, Return, exec, kitty
  '';

  home.packages = with pkgs; [
    # Window Manager
    picom
    polybar
    sxhkd
  ];
}

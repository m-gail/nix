{ config, pkgs, ... }:

{
  xdg.configFile = {
    kitty = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/kitty/.config/kitty";
      recursive = true;
    };
    rofi = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/rofi/.config/rofi";
      recursive = true;
    };
  };    

  home.packages = with pkgs; [
    dunst
    feh
    firefox-bin
    kitty
    rofi
  ];
}

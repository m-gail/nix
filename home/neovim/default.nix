{ config, pkgs, ... }:

{
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/vim/.config/nvim";
      recursive = true;
    };
  };    

  home.packages = with pkgs; [
    neovim
  ];
}

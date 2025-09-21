{ config, pkgs, ... }:

{
  imports = [ ./dock ];
  home.homeDirectory = "/Users/ganshun";
  local = {
    dock.username = "${config.home.username}";
    dock.enable = true;
    dock.entries = [
      { path = "/System/Applications/Messages.app/"; }
      { path = "/Applications/Google Chrome.app/"; }
      { path = "${config.home.homeDirectory}/.nix-profile/Applications/Alacritty.app/"; }
      { path = "${config.home.homeDirectory}/.nix-profile/Applications/Firefox.app/"; }
      { path = "${config.home.homeDirectory}/"; options = "--sort name --view grid --display folder";}
      # {
      #   path = "${config.users.users.ganshun.home}/";
      #   section = "others";
      #   options = "--sort name --view grid --display folder";
      # }
    ];
  };
  programs.git.enable = true;
  programs.git.extraConfig = {
    core.editor = "vim";
  };
}

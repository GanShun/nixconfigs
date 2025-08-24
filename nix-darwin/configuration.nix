{ config, pkgs, lib, inputs, ... }:

{
  imports = [ ./dock ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.vim
      pkgs.home-manager
      pkgs.dockutil
    ];

  users.users.ganshun = {
    name = "ganshun";
    home = /Users/ganshun;
  };
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  local = {
    dock.username = "${config.users.users.ganshun.name}";
    dock.enable = true;
    dock.entries = [
      { path = "/System/Applications/Messages.app/"; }
      { path = "/System/Applications/Facetime.app/"; }
      { path = "/Applications/Google Chrome.app/"; }
      { path = "/Users/ganshun/.nix-profile/Applications/Alacritty.app/"; }
      { path = "/Users/ganshun/"; options = "--sort name --view grid --display folder";}
      # {
      #   path = "${config.users.users.ganshun.home}/";
      #   section = "others";
      #   options = "--sort name --view grid --display folder";
      # }
    ];
  };
  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

}

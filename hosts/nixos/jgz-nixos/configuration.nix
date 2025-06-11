{ config, lib, pkgs, ... }:
{
  imports =
    [ 
      ./nixos-mods
      ./hardware-configuration.nix
    ];

  time.timeZone = "Europe/Amsterdam";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };


  environment = {
    systemPackages = with pkgs; [
      vim
    ];
  };

  system.stateVersion = "25.05";
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
 let hostname = "port";
in {
  networking.hostName = hostname; # Define your hostname.
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (/home/vertex/.config/dotfiles/nixos + "/${hostname}.nix")
    ];
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  # Set your time zone.
  time.timeZone = "America/Phoenix";
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    neovim
    vim
    git
    lazygit
    colima
    lazydocker
    alejandra
    mako
  ];
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
}

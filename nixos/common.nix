# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  #stdenv,
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
    _1password
    _1password-gui
    alacritty
    alejandra
    cascadia-code
    colima
    eza
    flameshot
    fzf
    gum
    git
    lazygit
    lazydocker
    libnotify
    neovim
    nixFlakes
    mise
    pinta
    steam
    tailscale
    ulauncher
    vim
    vlc
    wget
    wmctrl
    zellij
    zoxide
  ];
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  /*
    stdenv.mkDerivation = {
    name = "custom-scripts";
    src = ./.;
    phases = ["installPhase"];
    installPhase = "mkdir -p $out/bin; cp -r $src $out/bin";
  };
  */
}

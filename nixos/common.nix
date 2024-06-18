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
    bat
    btop
    cascadia-code
    colima
    eza
    fastfetch
    fira # FiraMono and sans
    flameshot
    fzf
    gum
    git
    jetbrains-mono # font
    lazygit
    lazydocker
    libnotify
    neovim
    nerdfonts
    nixFlakes
    meslo-lg # font
    mise
    pinta
    plocate
    ripgrep
    steam
    tailscale
    typora
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
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
  ];

  /*
    stdenv.mkDerivation = {
    name = "custom-scripts";
    src = ./.;
    phases = ["installPhase"];
    installPhase = "mkdir -p $out/bin; cp -r $src $out/bin";
  };
  */
}

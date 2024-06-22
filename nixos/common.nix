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
  services.tailscale.enable = true;

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
    cl
    clang
    colima
    docker
    elixir
    elixir-ls
    eza
    fastfetch
    fira # FiraMono and sans
    fira-code-nerdfont
    flameshot
    fzf
    gcc
    gum
    gnumake
    git
    inconsolata-nerdfont
    jetbrains-mono # font
    lazygit
    lazydocker
    libnotify
    neovim
    nextcloud-client
    nixFlakes
    nodejs_22
    meslo-lg # fonti
    meslo-lgs-nf
    python3
    pinta
    plocate
    ruby_3_3
    ripgrep
    steam
    tailscale
    typora
    ulauncher
    virtualbox
    vim
    vimPlugins.LazyVim
    vlc
    wget
    wmctrl
    zellij
    zig
    zoxide
  ];

  # Enable virtualization
  boot.kernelModules = ["kvm-amd" "kvm-intel"];
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["vertex"];
  virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;

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

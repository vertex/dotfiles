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
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.tailscale.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    _1password
    _1password-gui
    alacritty
    alejandra
    bat
    btop
    bun
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
    gnome3.gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.tactile
    gnumake
    git
    inconsolata-nerdfont
    jetbrains-mono # font
    lazygit
    lazydocker
    librewolf
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
    vscode
    vim
    vimPlugins.LazyVim
    vlc
    wget
    wmctrl
    zed-editor
    zellij
    zig
    zoxide
    linuxKernel.packages.linux_zen.system76
    linuxKernel.packages.linux_6_9_hardened.system76
  ];
  hardware.system76.enableAll = true;
  services.power-profiles-daemon.enable = false;
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

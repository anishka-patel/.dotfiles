# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
  boot.plymouth.enable = true;

  networking.hostName = "ani-nixos-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  console = {
    earlySetup = true;
    packages = with pkgs; [ terminus_font ];
    font="ter-u32n";
  };

  services.xserver.enable = true;  

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  # Enable sway
  programs.sway.enable = true;
  programs.sway.xwayland.enable = true;
  programs.sway.extraPackages = with pkgs; [swaylock swayidle foot dmenu-wayland wofi mako autotiling];
  programs.sway.extraSessionCommands = ''
      export QT_QPA_PLATFORM=wayland
      export QT_QPA_PLATFORMTHEME=qt6ct
      export GTK_THEME=Dracula
      export ICON_THEME=Dracula
      export XCURSOR_THEME=Dracula-cursors
      export XCURSOR_SIZE=36
    '';

  programs.waybar.enable = true;

  programs.neovim.defaultEditor = true;
  programs.neovim.enable = true;
  programs.neovim.withPython3 = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.viAlias = true;

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Enable Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Enable interception-tools
  services.interception-tools.enable = true;
  services.interception-tools.udevmonConfig = ''
    - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.caps2esc}/bin/caps2esc -m 1 | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
      DEVICE:
        EVENTS:
          EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
  '';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Default shell
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ bash zsh ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ani = {
    isNormalUser = true;
    description = "Anishka Patel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    # Browsers
      firefox
      brave
      google-chrome
      qutebrowser
    # Audio & Video
      vlc
      kdenlive
      handbrake
      elisa
      audacity
      lmms
      obs-studio
      pamixer
    # Photos
      gimp
      kdePackages.gwenview
      krita
      inkscape
      libresprite
    # Office
      onlyoffice-bin
      libreoffice-qt6-fresh
      kdePackages.spectacle
      kdePackages.okular
      hplipWithPlugin
      pandoc
      zathura
    # TextEditors & IDEs
      neovide
      kdePackages.kate
      vim-full
      neovim
      vscodium-fhs
    # Dev
      git
      gh
      python3
      nodejs_22
      rustup
      go
      docker
    # 3D
      godot_4
      blender
      freecad
    # Internet
      thunderbird
    # Pentest
      ghidra-bin
      wireshark
      android-tools
    # Termnal Emulators
      kitty
      xterm
      tmux
      foot
    # Terminal Applications
      ranger
      lynx
      lazygit
      trash-cli
      tldr
      feh
      scrot
      grim
      slurp
      grimblast
      cliphist
    # Neoutils
      yazi
      zellij
      moar
      lsd
      eza
      pfetch
      fastfetch
      starship
      zoxide
      fzf
      bat
    # Shells
      bash
      bash-completion
      zsh
      zsh-completions
      zsh-autosuggestions
      zsh-syntax-highlighting
      zsh-history-substring-search
    # Sys utils
      conky
      htop
      duf
      ncdu
      gzip
      powertop
      sysstat
      wlogout
    # Dev
      gnumake
      go
      cmake
      gcc
      rustup
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim-full # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    networkmanagerapplet
    neovim
    mako
    git
    gh
    wget
    gzip
    fd
    fzf
    ripgrep
    rclone
    sd
    htop
    duf
    ncdu
    moar
    lsd
    eza
    pfetch
    starship
    powertop
    stow
    tree
    zip
    unzip
    bat
    dracula-theme
    dracula-icon-theme
    wofi
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    nwg-look
    nerdfonts
  ];

  fonts.packages = with pkgs; [nerdfonts];
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

}


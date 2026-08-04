{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings.General = {
            Experimental = true;
            FastConnectable = true;
        };
        settings.Policy = {
            AutoEnable = true;
        };
    };
  };


  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    qrca
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."pippo" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "pippo";
    extraGroups = [ 
      "audio"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      foot
      lswt
      swaylock
      swaybg
      waybar
      wofi
    ];
  };

  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  programs.zsh = {
    enable = true;
    # These settings speed up zsh startup pergormance
    # config and compinit is done in ~/.zshrc
    enableCompletion = false;
    enableGlobalCompInit = false;
    autosuggestions.enable = false;
    syntaxHighlighting.enable = false;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	# DEVELOPMENT BASICS
    clang
    cmakeMinimal
    codeberg-cli
    gcc
    git
    github-cli
    gnumake
    leiningen
    uv

# PROGRAMMING LANGUAGES 
    clojure
    elixir
    erlang
    gleam
    go
    jdk
    lua
    luarocks
    nodejs
    php
    phpPackages.composer
    python3
    ruby
    zig

# RUST
    rustc
    cargo
    clippy
    rustfmt

# LSPs
    bash-language-server
    clang-tools # provides clangd
    clojure-lsp
    gopls
    jdt-language-server
    lua-language-server
    phpactor
    pyright
    ruff
    rust-analyzer
    texlab
    tinymist
    tombi
    zls

# EDITORS
  emacs
    neovim
    vim

# LaTeX
    biber
    texliveFull

# Others
    brightnessctl
    brave
    btop
    diff-so-fancy
    dropbox
    dunst
    dysk
    eza
    fastfetch
    fd
    foot
    fzf
    guitarix
    gvfs
    hunspell
    hunspellDicts.it-it
    hydrogen
    kdePackages.yakuake
    killall
    kmymoney
    lazygit
    libreoffice
    networkmanagerapplet
    onefetch
    pandoc
    pamixer
    papirus-icon-theme
    pavucontrol
    proton-vpn
    qpdf
    ripgrep
    ripgrep-all
    rsync
    speedtest-cli
    starship
    stow
    thunar
    thunderbird
    tldr
    tmux
    tradingview
    tuxguitar
    typst
    unzip
    vlc
    yazi
    zathura
    zotero
    zoxide
    zsh
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
  ];

  # SERVICES
  services = {
    blueman.enable = true;
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}

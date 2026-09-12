{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "nixos";
    wireless.enable = true;
    networkmanager.enable = true;
  };

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

  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORMTHEME = "kde";
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    qrca
  ];
  # This allows dolphin to find app launchers also when running in a WM
  environment.etc."xdg/menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  security.rtkit.enable = true;

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
      "widget.use-xdg-desktop-portal.file-picker" = 0;
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

  environment.systemPackages =
    with pkgs;
    let
      boilertex = pkgs.callPackage /etc/nixos/boilertex.nix { };
      tgr = pkgs.callPackage /etc/nixos/tgr.nix { };
    in
    [
      # DEVELOPMENT BASICS
      clang
      cmakeMinimal
      codeberg-cli
      gcc
      git
      github-cli
      gnumake
      tree-sitter
      uv

      # PROGRAMMING LANGUAGES
      go
      jdk
      lua
      luarocks
      nodejs
      php
      phpPackages.composer
      python3
      zig

      # RUST
      rustc
      cargo
      cargo-binstall
      clippy
      rustfmt

      # LSPs
      bash-language-server
      clang-tools # provides clangd
      gopls
      jdt-language-server
      lua-language-server
      nixd
      nixfmt
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
      vscode

      # LaTeX
      biber
      texliveFull

      # Others
      bat
      brightnessctl
      brave
      btop
      diff-so-fancy
      dropbox
      dunst
      dysk
      easytag
      eza
      fastfetch
      fd
      foot
      fzf
      gimp
      groff
      guitarix
      gvfs
      hunspell
      hunspellDicts.en_US
      hunspellDicts.it_IT
      kdePackages.kcalc
      kdePackages.partitionmanager
      kdePackages.yakuake
      kmymoney
      lazygit
      libreoffice
      networkmanagerapplet
      nix-init
      ntfs3g
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
      thunderbird
      tldr
      tmux
      tradingview
      tuxguitar
      typst
      unzip
      whatsie
      yazi
      yt-dlp
      zathura
      zip
      zoom-us
      zotero
      zoxide
      zsh

      # Custom packages
      boilertex
      tgr
    ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.iosevka
    nerd-fonts.ubuntu-mono
    nerd-fonts.terminess-ttf
  ];

  # SERVICES
  services = {
    blueman.enable = true;
    desktopManager.plasma6.enable = true;
    devmon.enable = true;
    displayManager.sddm.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    udisks2.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}

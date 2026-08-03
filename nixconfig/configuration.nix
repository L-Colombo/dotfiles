{ config, pkgs, ... }:

{
  nix = {
    settings.experimental-features = [ 
        "nix-command"
        "flakes"
    ];
  };

  imports =
    [ 
      ./hardware-configuration.nix
    ];

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "0";
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
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

    graphics.enable = true;

    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      open = false;

      # Enable the Nvidia settings menu,
	  # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


  hardware.nvidia = {
  };

# Enable the KDE Desktop Environment.
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    qrca
  ];

# Enable river-classic
  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
        swaylock
        swaybg
        foot
        waybar
        wlr-randr
        wofi
    ];
  };

# Enabled programs
  programs.firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
  };
  programs.zsh.enable = true;

# Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

# Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.users."pippo" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "pippo";
    extraGroups = [ 
        "networkmanager"
        "wheel"
        "audio"
        "video"
    ];
  };

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
# DEVELOPMENT BASICS
    clang
    cmakeMinimal
    gcc
    git
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
    birdtray
    brave
    btop
    diff-so-fancy
    dbeaver-bin
    dropbox
    dunst
    dysk
    eza
    fastfetch
    fd
    foot
    fzf
    guitarix
    hydrogen
    killall
    kmymoney
    lazygit
    networkmanagerapplet
    onefetch
    pandoc
    pavucontrol
    proton-vpn
    qpdf
    ripgrep
    ripgrep-all
    rsync
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
    yakuake
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

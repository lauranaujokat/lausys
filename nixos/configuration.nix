# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      laura = import ./home.nix;
    };
  };
  networking.hostName = "nixblade"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  security = {
    rtkit.enable = true;
  };

  boot.loader = {
    efi = {canTouchEfiVariables = false;};
    grub = {
      efiSupport = true;
      enable = true;
      device = "nodev";
      useOSProber = true;
      theme = pkgs.stdenv.mkDerivation {
        pname = "catppuccin-macchiato-grub";
        version = "1.0";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "88f6124";
          hash = "sha256-e8XFWebd/GyX44WQI06Cx6sOduCZc5z7/YhweVQGMGY=";
        };
        installPhase = "cp -r ./src/catppuccin-macchiato-grub-theme $out";
      };
    };
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking

  # Set your time zone.

  # Configure keymap in X11
  hardware = {
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
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  services = {
    blueman.enable = true;
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      displayManager = {
        setupCommands = "";
        defaultSession = "none+i3";
        sddm = {
          enable = true;
          theme = "catppuccin-macchiato";
        };
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  programs.fish.enable = true;
  users = {
    users.laura = {
      isNormalUser = true;
      description = "laura";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.fish;
      packages = with pkgs; [];
    };
    defaultUserShell = pkgs.fish;
  };

  # make it take up less space
  nix.settings.auto-optimise-store = true;

  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    #terminal tools
    kitty #terminal
    fish #shell
    eza #ls but cool
    yazi #file browser
    ripgrep #rip grep
    starship # pretty prompt
    wget #for getting stuff
    zoxide #fancy CD
    lazygit #fancy git
    ncdu # space usage shower

    #programming stuff
    neovim #text editor/ide
    cargo #rust tooling
    git #git
    gcc #gcc compiler

    # language server
    rust-analyzer # rust
    clang-tools # c stuff
    lua-language-server # lua
    nil # nix

    # formatters
    stylua # lua
    alejandra # nix

    #catppuccin stuff
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    (callPackage ./packages/catppuccin-sddm.nix {}).catppuccin-sddm

    # normal programs
    chromium
    revolt-desktop
    keepassxc
    signal-desktop
    obsidian
    element-desktop
    prismlauncher
    obs-studio

    # rice
    picom # composer
    polybar # pretty bar on top
    conky #status stuff in background
    rofi # dmenu

    # tools
    pavucontrol # controlling audio
    arandr # controlling display stuff
    flameshot # screenshots
    xclip # clipboard
    brightnessctl

    # system
    jdk17
  ];

  system.stateVersion = "23.11";
}

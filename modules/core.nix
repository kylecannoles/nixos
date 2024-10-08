{ config, pkgs, lib, ... }:

{
  # Enable Firmware Updates
  hardware.enableRedistributableFirmware = true;
  
  # Allow system to automatically upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  #boot.loader.systemd-boot.enable = lib.mkDefault true; # (for UEFI systems only)
  #boot.loader.systemd-boot.configurationLimit = lib.mkDefault 10;
  boot.loader.grub.configurationLimit = lib.mkDefault 10;
  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 1w";
  };

  nix.settings = {
    # Manual optimise storage: nix-store --optimise
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    auto-optimise-store = true;
    builders-use-substitutes = true;
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };

  networking.hostName = lib.mkDefault "nixos"; # Define your hostname.
  time.timeZone = lib.mkDefault "Asia/Tokyo"; # Set your time zone.

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Set environmental variables
  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_CACHE_HOME  = "$HOME/.cache";
  };

  # Add Japanese language IME
  i18n.inputMethod = {
    enabled = "fcitx5";
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ 
      fcitx5-mozc
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      fcitx5-configtool
    ];
  };

  # for power management
  services.auto-cpufreq.enable = true;
  #services = {
  #  power-profiles-daemon = {
  #    enable = true;
  #  };
  #  upower.enable = true;
  #};

    services.displayManager = {
      sddm.enable = lib.mkDefault true;
    };
  
  services.xserver = {
    enable = lib.mkDefault true;
    desktopManager.xfce.enable = true; # Use xfce for x11 by default
    xkb.layout = lib.mkDefault "jp";
  };
  
# picom for xfce
  services.picom = {
    enable = true;
    fade = true;
    inactiveOpacity = 0.9;
    shadow = true;
    fadeDelta = 4;
  };

  services.flatpak.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #xdg.portal.config.common.default = "gtk";
  # Need to add flatpak repo and update
  # flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  # flatpak update  

  # consider BorgBackup, Plotinus

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    zsh #zsh-powerlevel10k
    lukesmithxyz-st kitty alacritty #st main w/ alacritty backup
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget curl
    aria2
    git # used by nix flakes
    ripgrep
    fzf
    fd
    lf
    neofetch
    htop
    iotop
  ];
}

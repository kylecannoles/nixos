{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;
  };
  programs.starship.enable = true;
  programs.git = {
    enable = true;
    config = {
      core = { editor = "nvim"; };
      init = { defaultBranch = "main"; };
      color = { ui = "auto"; };
      pull = { rebase = false; };
    };
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };
  services = { # for thunar
    gnome.gnome-keyring.enable = true; # enable gnome-pinentry
    gvfs.enable = true; # Mount, trash, drive mounting, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };
  programs.yazi.enable = true;
  programs.firefox.enable = true;
  programs.browserpass.enable = true;
  programs.gnupg.agent = {
    enable = true;
    #pinentryFlavor = "gnome3";
    enableSSHSupport = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lukesmithxyz-st kitty alacritty # terminal
    starship
    cava # audio visualizzer
    neofetch # system info
    btop htop # resource monitor
    gopass
  ];
}

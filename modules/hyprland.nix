{ config, pkgs, lib,... }: {
  # Enable wayland wl-roots
  #xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;
  #};

  #environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw 

  services = {
    gvfs.enable = true; # Drive mounting, trash, etc.
    tumbler.enable = true; # Thumbnail support for images
    xserver = {
      #enable = lib.mkForce false;
      desktopManager = {
        xterm.enable = true;
      };
    };
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "chili";
      };
    };
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    # thunar GUI file manager
    thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
    dconf.enable = true; # Used by eww config?
  };

   environment.systemPackages = with pkgs; [
     #wayland utils
     waybar #use unstable version?
     swaybg # wallpaper #alternative hyprpaper
     swayidle # idle timeout
     swaylock # lock the screen
     brightnessctl # change the screen brightness
     gammastep # reduce blue light from screen
     wlogout # logout menu
     wl-clipboard # copy & paste
     hyprpicker # color picker
     #hyprcursor # custom cursor themes
     wf-recorder # screen recording
     dunst # notification manager #alternatives mako
     wofi # program launcher
     wofi-emoji # emoji searcher?
     wf-recorder # screen recording
     grim # screenshot tool
     slurp # select region to capture
     #libsForQt5.polkit-kde-agent
     #libsForQt5.qt5.qtwayland
     #qt6.qtwayland
     dconf # gnome system config
     #xdg-desktop-portal-hyprland # should be automatically included
     foot # wayland terminal emulator

     # environment specific programs
     #yad # fork of zenity, for creating dialog windows
     alsa-utils # provides amixer/alsamixer/etc.
     mpd # music player daemon server
     ncmpcpp #mpd client # alternative: mpc-cli
     pavucontrol

     networkmanagerapplet # provides GUI app: nm-connection-editor
     blueman


     #eww-wayland # GUI widgets
     #eww bar requirements
     #cava
     #starship
     #btop
     #pavucontrol
     #bc
     #blueberry
     #bluez
     #boost
     #coreutils
     #findutils
     #fzf
     #gawk
     #gojq
     #glib
     #gtklock
     #gtklock-playerctl-module
     #gtklock-powerbar-module
     #gtklock-userinfo-module
     #imagemagick
     #libqalculate
     #librsvg
     #light
     #networkmanager
     #networkmanagerapplet
     #nlohmann_json
     #pavucontrol
     #plasma-browser-integration
     #playerctl
     #procps
     #ripgrep
     #socat
     #sox
     #swww
     #udev
     #upower
     #util-linux
     #xorg.xrandr
   ];

  # Autostart Hyprland
#  environment.loginShellInit = ''
#    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#      exec Hyprland
#    fi
#  '';

  # fix https://github.com/ryan4yin/nix-config/issues/10
  security.pam.services.swaylock = {};
  security.polkit.enable = true;
}

{ config, pkgs, lib,... }:
{
  # Configure Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      #i3pystatus (python3.withPackages(ps: with ps; [ i3pystatus keyring ]))
      brightnessctl
      swaylock
      swayidle
      xwayland
      kanshi
      grim
      slurp
      wl-clipboard
      wf-recorder
      swaylock
      mako # notification daemon
      alacritty # Alacritty is the default terminal in the config
      kitty
      #dmenu # Dmenu is the default in the config but i recommend wofi since it's wayland native
      waybar
      autotiling
      gammastep
      wofi
      flashfocus
      ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
      export WLR_NO_HARDWARE_CURSORS=1
      export WLR_RENDERER_ALLOW_SOFTWARE=1
    '';
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  #services.xserver.displayManager.defaultSession = "sway";
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.libinput.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "jp";
  # services.xserver.xkbOptions = "eurosign:e";
}

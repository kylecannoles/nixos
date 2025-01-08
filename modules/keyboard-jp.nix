
{ config, lib, pkgs, ... }:

{
  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
   console = {
     #font = "Lat2-Terminus16";
     keyMap = "jp106";
     #useXkbConfig = true; # use xkb.options in tty.
   };

  # Configure keymap in X11
  services.xserver.xkb.layout = "jp";
  #services.xserver.xkb.options = "eurosign:e,caps:escape";

}

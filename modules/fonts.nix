{ config, pkgs, lib, ... }:
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
      (nerdfonts.override {
        fonts = [ "FiraCode" ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif NF" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "FiraCode" ];
      };
    };
  };
}

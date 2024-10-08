{ config, pkgs, lib, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerdfonts
      (nerdfonts.override {
        fonts = [ "FiraCode" "Noto" ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif NF" "Noto Serif CJK JP" ];
        sansSerif = [ "Noto Sans NF" "Noto Sans CJK JP" ];
        monospace = [ "FiraCode" ];
      };
    };
  };
}

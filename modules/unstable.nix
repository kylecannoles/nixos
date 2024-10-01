{ config, pkgs, lib,... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = with pkgs; [
    unstable.waybar
    unstable.hyprland
  ];
}

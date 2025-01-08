{ config, lib, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      default = "saved";
      useOSProber = true;
    };
  };
}

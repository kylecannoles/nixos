{ config, pkgs, lib, ... }:

{
   # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.kyle = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "networkmanager" "vboxusers" "libvirtd" ]; # wheel group enables ‘sudo’ for the user.
     home = "/home/kyle";
     initialPassword = "pw123";
     shell = pkgs.bash;
   };
   services.getty.autologinUser = lib.mkDefault "kyle";
   services.displayManager = {
     autoLogin.enable = lib.mkDefault true;
     autoLogin.user = lib.mkDefault "kyle";
   };
  programs.git = {
    config = {
      user = {
        name = "Kyle Cannoles";
        email = "kylecann@hawaii.edu";
      };
    };
  };
  users.defaultUserShell = pkgs.bash;
}

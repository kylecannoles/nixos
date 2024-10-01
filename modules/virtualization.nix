{ config, pkgs, lib,... }:
{
   environment.systemPackages = with pkgs; [
     # OS virtualization 
     libvirt
     virt-manager
     qemu
     spice-gtk
     #polkit_gnome
   ];
  # Configure virtualbox
  #virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = [ "kyle" ];
  # Add firewall exception for VirtualBox provider
  #networking.firewall.extraCommands = ''
  #  ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
  #'';

  # Enable libvirtd/qemu virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}

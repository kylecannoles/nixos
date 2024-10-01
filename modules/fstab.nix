{ config, pkgs, lib,... }:

{
  # Configure fstab
  fileSystems."/boot/efi" = 
    { device = "/dev/disk/by-uuid/16FB-38C6";
      fsType = "vfat";
    };
  fileSystems."/mnt/manjaro" = 
    { device = "/dev/disk/by-uuid/8faac9b7-478d-464e-9573-7b55525f07eb";
      fsType = "ext4";
      options = [ "nofail,x-systemd.automount,noauto,x-systemd.mount-timeout=1ms" ];
    };
#  fileSystems."/media/transcend" = 
#    { device = "/dev/disk/by-uuid/8FB1-D5E1";
#      fsType = "vfat";
#      options = [ "nofail,x-systemd.automount,noauto,x-systemd.mount-timeout=1ms" ];
#    };
#  fileSystems."/media/usb" = 
#    { device = "/dev/disk/by-uuid/0EEE-F900";
#      fsType = "vfat";
#      options = [ "nofail,x-systemd.automount,noauto,x-systemd.mount-timeout=1ms" ];
#    };
#  fileSystems."/mnt/nas" = 
#    { device = "//10.1.7.170/wd";
#      fsType = "cifs";
#      options = [ "user,uid=1000,gid=1001,x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=30,_netdev,credentials=/etc/nixos/smb-secrets" ];
#    };
}

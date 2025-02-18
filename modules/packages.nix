{ config, pkgs, lib, ... }:
{
   # Enable installation of unfree packages
   nixpkgs.config.allowUnfree = true;
   # List packages installed in system profile. To search, run:
   #$ nix search wget
   environment.systemPackages = with pkgs; [
     #system utils
     gopass
     #pinentry
     #gnupg
     pinentry-gnome3
     #pinentry-qt
     #pinentry-gtk2
     grim slurp wayshot # screenshots
     wl-clipboard # copy to clipboard
     #powertop # Power usage management for intel processors
     sysstat
     cifs-utils
     ffmpeg
     gparted
     polkit_gnome     
     p7zip # 7zip archiver
     unzip
     jq
     # gtk
     gtk3
     adwaita-icon-theme
     sweet
     sddm-chili-theme
     bibata-cursors
     # graphics driver
     mesa
     # keyboard
     keyd
     # remote management
     vagrant
     ansible
     # fonts
     meslo-lgs-nf # for powerlevel10k
     # office/media
     freeoffice libreoffice
     audacity
     reaper
     gimp
     mpv jellyfin-mpv-shim
     ncmpcpp
     yt-dlp
     # Japanese
     file # used for impd compressed audio
     anki
     mecab # used for anki Japanese sentence parsing
     poetry
     #(python3.withPackages(ps: with ps; [ pywal build material-color-utilities pillow tkinter ])) # What is this used for? MPV or Anki?
     #text editor
     #neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     vscodium 
     #vscode
     # programming
     gcc
     git
     docker
     gitstatus
     # browsers
     brave
     ungoogled-chromium
     #chromium
     #firefox
     #librewolf
     browserpass
     # chat
     #webcord-vencord
     # utils
     inxi glxinfo xorg.xdpyinfo # see info about graphics cards
     ncdu # see disk usage
     # audio
     pulseaudio  # provides `pactl`, which is required by some apps(e.g. sonic-pi)
     pavucontrol # pulse audio control GUI
   ];
}

{ config, pkgs, lib, ... }:
{
  # all fonts are linked to /nix/var/nix/profiles/system/sw/share/X11/fonts
  fonts = {
    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # Noto is a font family designed and maintained by Google. It was designed to cover the entire unicode codespace in order to prevent squares (called tofu) from being displayed when browsing the web. It is where the name Noto comes from (No tofu).
      # There is a version of Noto for East Asian languages called Noto Sans/Serif CJK, which covers SC/TC/HK/JP/KR languages.
      noto-fonts-cjk-sans # Provides East Asian language glyphs
      noto-fonts-cjk-serif # Provides East Asian language glyphs
      noto-fonts-emoji # Provides colored emoji
      noto-fonts-extra # Provides additional weights and widths
      notonoto # Noto sans mono + Noto sans CJK JP

      # Source is a open source font family commissioned by Adobe. The Han version includes East Asian language support and is a joint font with Google's Noto CJK font.
      #source-sans # Sans serif fonts including Source Sans 3, Source Sans Pro, and Source Sans 3 VF
      #source-serif # Serif fonts including Source Code Pro
      #source-han-sans # Sans serif CJK support
      #source-han-serif # Serif CJK support

      # IBM Plex Mono including JP and Nerdfonts 
      plemoljp-nf

      # nerdfonts
      (nerdfonts.override {
        fonts = [
                  "FiraCode"
                  "JetBrainsMono"
                  "Noto"
        ];
      })
      #nerd-fonts.fira-code
      #nerd-fonts.jetbrains-mono
      #nerd-fonts.noto

      #wqy_zenhei

      #(pkgs.callPackage ../../fonts/icomoon-feather-icon-font.nix {})
    ];

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Noto Serif CJK JP" "Noto Color Emoji"]; # "Noto Serif"
      sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"]; # "Noto Sans"
      monospace = ["FiraCode Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}

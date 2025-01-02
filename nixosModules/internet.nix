
{pkgs, config, lib, ... }:
{

  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)

      discord-canary
      nicotine-plus
      webtorrent_desktop
      tor-browser
      soulseekqt

      spotube
      
      signal-desktop
      signal-cli
    ;
    inherit
    (pkgs.nodePackages)
      #webtorrent-cli
    ;
    inherit
    (pkgs.kdePackages)
      konversation
    ;
  };



  home-manager.users.${config.my.username}={
    programs.firefox.enable =true;
    programs.librewolf.enable = true;

  };

# Tiny Tiny RSS
  services.tt-rss = {
    enable = true;
    # to configure a nginx virtual host directly:
    virtualHost = "tt-rss.example.com";
    selfUrlPath = "https://tt-rss.example.com";
    # or for hosting on sub-path:
      #selfUrlPath = "https://example.com/tt-rss";
  };
}

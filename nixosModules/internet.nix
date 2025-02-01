
{pkgs, config, lib, ... }:
{

  environment.systemPackages = [

      pkgs.discord-canary
      pkgs.nicotine-plus
      pkgs.webtorrent_desktop
      pkgs.tor-browser
      #pkgs.soulseekqt

      pkgs.riseup-vpn
      pkgs.protonvpn-cli
      pkgs.protonvpn-gui
      pkgs.protonvpn-cli_2
      pkgs.i2p
      pkgs.i2pd
    pkgs.mullvad-vpn

      pkgs.spotube
      pkgs.signal-desktop
      pkgs.signal-cli

      #webtorrent-cli
      pkgs.konversation

      #Nitter/Twitter anon
      #pkgs.nim
      #pkgs.nimble
      #pkgs.libsass
      #pkgs.redis
      #pkgs.nitter
  ];
  #services.i2p.enable = true;
  services.i2pd.enable = true;


  home-manager.users.${config.my.username}={
    programs.firefox.enable =true;
    programs.librewolf.enable = true;

  };
#  services.nitter.enable = true;
# Tiny Tiny RSS
  #services.tt-rss = {
  #  enable = true;
  #  # to configure a nginx virtual host directly:
  #  virtualHost = "tt-rss.example.com";
  #  selfUrlPath = "https://tt-rss.example.com";
  #  # or for hosting on sub-path:
  #    #selfUrlPath = "https://example.com/tt-rss";
  #};
}

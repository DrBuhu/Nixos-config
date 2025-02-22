{pkgs, config, ... }:
{
  imports =
    [ # programs that need extra config
     
    ];

  environment.systemPackages = [
    pkgs.audacity # Recoder/sound editor
    pkgs.vlc
    pkgs.mpd
    pkgs.eartag
    pkgs.tauon ## Music Player
    pkgs.grimblast
    pkgs.puddletag
    pkgs.picard
    pkgs.picard-tools
    pkgs.kid3-qt
    pkgs.beets
    pkgs.kid3-cli
    pkgs.easytag
    pkgs.playerctl
  ];


  home-manager.users.${config.my.username}={
   
  };

}

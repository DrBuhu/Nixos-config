{pkgs, config, ... }:
{
  imports =
    [ # programs that need extra config
     
    ];

  environment.systemPackages = [
    pkgs.audacity # Recoder/sound editor
    pkgs.vlc
    pkgs.mpd
    pkgs.tauon ## Music Player
    pkgs.grimblast
  ];


  home-manager.users.${config.my.username}={
   
  };

}

{pkgs, config, ... }:
{
  imports =
    [ # programs that need extra config
     
    ];

  environment.systemPackages = [
    pkgs.audacity # Recoder/sound editor
    pkgs.vlc
    pkgs.tauon ## Music Player
  ];


  home-manager.users.${config.my.username}={
   
  };

}

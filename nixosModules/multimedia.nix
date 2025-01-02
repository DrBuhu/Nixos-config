{pkgs, config, ... }:
{
  imports =
    [ # programs that need extra config
     
    ];

  environment.systemPackages = [
    pkgs.audacity
    pkgs.vlc
  ];


  home-manager.users.${config.my.username}={
   
  };

}

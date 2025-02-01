{pkgs, lib, config, ... }:
{

  environment.systemPackages =[
    pkgs.obsidian
    pkgs.libreoffice-qt
  ];


  home-manager.users.${config.my.username}={
  };
}

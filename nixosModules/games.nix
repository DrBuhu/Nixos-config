{pkgs, lib, config, ... }:
{

  programs={
    steam.enable = true;
  };

  environment.systemPackages =[
      pkgs.steam-run
      pkgs.prismlauncher #minecraft-launcher
      pkgs.asciiquarium
      pkgs.playonlinux
      pkgs.libssh

      #bsdgames
  ];

}

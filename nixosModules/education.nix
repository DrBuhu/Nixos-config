{config, pkgs,lib, ... }:

{


  imports =
    [ 
    ];




  environment.systemPackages =[
      pkgs.anki
      pkgs.maxima
      pkgs.wxmaxima
      pkgs.glib-networking # Network acces for maxima
      pkgs.ventoy-full
      pkgs.ciscoPacketTracer8
  ];
  # Smotth scrolling for Maxima
   home-manager.users.${config.my.username}={
     xdg.desktopEntries.wxmaxima ={
       name = "wxMaxima";
       exec = "GDK_BACKEND=x11 wxmaxima %f";
     };

   };
}

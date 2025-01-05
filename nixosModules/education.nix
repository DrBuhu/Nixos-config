{config, pkgs,lib, ... }:

{


  imports =
    [ 
    ];




  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      anki
      maxima
      wxmaxima
      glib-networking # Network acces for maxima
    ;
  };
  # Smotth scrolling for Maxima
   home-manager.users.${config.my.username}={
     xdg.desktopEntries.wxmaxima ={
       name = "wxMaxima";
       exec = "GDK_BACKEND=x11 wxmaxima %f";
     };

   };
}

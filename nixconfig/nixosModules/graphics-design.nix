{
  lib,
  inputs,
  pkgs,
  config,
  nixpkgs,
#  nixpkgs-old-davinci,
  ... }:

let affinity-nix = inputs.affinity-nix; in
{


  environment.systemPackages = [
    pkgs.blender
    pkgs.jetbrains-mono
    pkgs.ffmpeg
    pkgs.grimblast
    pkgs.vdhcoapp #Download Helper - Firefox Extension
    pkgs.gimp
    pkgs.qimgv
    #      davinci-resolve-studio 
    pkgs.shotcut


    affinity-nix.packages.x86_64-linux.photo

    affinity-nix.packages.x86_64-linux.designer

    affinity-nix.packages.x86_64-linux.publisher
    
#    inherit
#      (nixpkgs-old-davinci)
#        davinci-resolve-studio
#      ;
  
  ];
  fonts.packages = [
    pkgs.nerdfonts
  ];
  home-manager.users.${config.my.username}={
    xdg.userDirs.enable =true;
    
    };


}

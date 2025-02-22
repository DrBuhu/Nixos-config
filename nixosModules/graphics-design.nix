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
      pkgs.vdhcoapp #Download Helper - Firefox Extension

      pkgs.gimp

      pkgs.davinci-resolve-studio
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
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };

    
    };


}

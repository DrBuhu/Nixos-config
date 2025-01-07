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


  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      blender
      jetbrains-mono
      ffmpeg
       
      vdhcoapp #Download Helper - Firefox Extension

      gimp



    ;
    inherit
    (affinity-nix.packages.x86_64-linux)
    photo
    designer
    publisher
    ;
#    inherit
#      (nixpkgs-old-davinci)
#        davinci-resolve-studio
#      ;
  };
  fonts.packages = [
    pkgs.nerdfonts
  ];
  home-manager.users.${config.my.username}={
    
    };


}

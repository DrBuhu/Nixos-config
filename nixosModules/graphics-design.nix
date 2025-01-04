{lib, inputs,pkgs, config, nixpkgs,  ... }:

let affinity-nix = inputs.affinity-nix; in
{


  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      blender
      davinci-resolve-studio
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

  };
  fonts.packages = [
    pkgs.nerdfonts
  ];
  home-manager.users.${config.my.username}={
    
    };


}

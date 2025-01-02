{ inputs,pkgs, config, nixpkgs,  ... }:

let affinity-nix = inputs.affinity-nix; in
{


  environment.systemPackages = [
    pkgs.blender #neovim copy
    pkgs.davinci-resolve-studio
    affinity-nix.packages.x86_64-linux.photo
    affinity-nix.packages.x86_64-linux.designer
    affinity-nix.packages.x86_64-linux.publisher

  ];
  home-manager.users.${config.my.username}={
    
    };


}

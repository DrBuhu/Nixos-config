{inputs, pkgs,  config, ... }:
{
  imports =
    [ 

      ../softwareconf/doom-emacs.nix  
      ../softwareconf/nvim.nix  
    ];

  environment.systemPackages = [
    pkgs.jetbrains-toolbox
    pkgs.vscodium-fhs
    pkgs.lazydocker
    pkgs.nodejs
  ]; 
    home-manager.users.${config.my.username}={
    programs.neovim.enable =true;
    programs.git.enable = true;
    programs.lazygit.enable = true;
    programs.doom-emacs = {
      enable = true;
    };
  };
  virtualisation.docker.enable = true;

}

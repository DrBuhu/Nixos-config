{inputs, pkgs,  config, ... }:
{
  imports =
    [ 

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
   # programs.doom-emacs = {
   #   enable = true;
   #   doomDir = inputs.doom-config;  # or e.g. `./doom.d` for a local configuration
   # };
  };
  virtualisation.docker.enable = true;

}

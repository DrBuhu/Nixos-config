{lib, inputs, pkgs,  config, ... }:
{
  imports =
    [ 

      ../softwareconf/doom-emacs.nix  
      ../softwareconf/nvim.nix  
    ];
  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      jetbrains-toolbox
      vscodium-fhs
      lazydocker

      # Languages
      nodejs
      python3
      pipx

      uv
      
      #DOOM - Emacs
      shellcheck
      nixd
      alejandra #Nix-Formatting
      nixfmt
    ;

  }; 
  home-manager.users.${config.my.username}={
    programs.neovim.enable =true;
    programs.git.enable = true;
    programs.lazygit.enable = true;
    programs.ripgrep.enable = true; # For doom-emacs
    #programs.doom-emacs = {
    #  enable = true;
    #};
  };
  virtualisation.docker.enable = true;

}

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
      # Docker
      lazydocker

      # Database
      mariadb

      # Languages
      nodejs
      python3
      pipx

      uv
      
      #DOOM - Emacs
      shellcheck
      nixd
      nil
      alejandra #Nix-Formatting
      nixfmt

      #Java
      jdk11
      jdk
      google-java-format
      jdt-language-server # cool suggestions
    ;

  };
  nix.nixPath = ["nixpkgs = $(inputs.nixpkgs)"];
  home-manager.users.${config.my.username}={

    programs={
      neovim.enable =true;
      git.enable = true;
      lazygit.enable = true;
      ripgrep.enable = true; # For doom-emacs
      java.enable = true;

    };

    #programs.doom-emacs = {
    #  enable = true;
    #};
  };
  virtualisation.docker.enable = true;

}

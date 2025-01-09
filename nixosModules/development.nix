{lib,  pkgs,  config, ... }:

let
  cfg = config.my.desktop;
  inherit (lib.lists) optionals;

in
{
  options.my.desktop = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = true;
    };

  };

 imports =
  [
    ../softwareconf/doom-emacs.nix
    ../softwareconf/nvim.nix
  ];
  config={
    environment.systemPackages = [

      #Docker
      pkgs.lazydocker

      # Languages
      pkgs.shellcheck
      pkgs.nixd
      pkgs.nil
      pkgs.python3
      pkgs.pipx
      pkgs.uv
      #DOOM - Emacs
      pkgs.shellcheck
      pkgs.nixd
      pkgs.nil
      pkgs.alejandra #Nix-Formatting
      pkgs.nixfmt

  ] ++ optionals cfg.enable [

      pkgs.jetbrains-toolbox
      pkgs.vscodium-fhs
      pkgs.mariadb

      ##Languages
      pkgs.nodejs
      pkgs.jdk11
      pkgs.jdk
      pkgs.google-java-format
      pkgs.jdt-language-server # cool suggestions
      pkgs.vscode-langservers-extracted
      pkgs.deno
      pkgs.typescript-language-server
      pkgs.typescript



  ];


  nix.nixPath = ["nixpkgs = $(inputs.nixpkgs)"];
    home-manager.users.${config.my.username}={
      programs={
        neovim.enable =true;
        java.enable = true;
        git.enable = true;
        lazygit.enable = true;
        ripgrep.enable = true; # For doom-emacs


    };

      #programs.doom-emacs = {
        #  enable = true;
        #};
  };
  virtualisation.docker.enable = true;

  };
}

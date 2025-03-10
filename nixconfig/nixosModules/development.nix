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
      pkgs.conda
      pkgs.uv
      pkgs.gcc
      pkgs.clang
      pkgs.zig
      #DOOM - Emacs
      pkgs.shellcheck
      pkgs.nixd
      pkgs.nil
      pkgs.alejandra #Nix-Formatting
      pkgs.zed-editor

  ] ++ optionals cfg.enable [

      pkgs.jetbrains-toolbox
      pkgs.vscodium-fhs
      pkgs.mariadb

      ##Languages
      pkgs.nodejs
      pkgs.jdk11
      pkgs.jdk
      pkgs.openjdk
      pkgs.google-java-format
      pkgs.jdt-language-server # cool suggestions
      pkgs.vscode-langservers-extracted
      pkgs.deno
      pkgs.typescript-language-server
      pkgs.typescript


      pkgs.kicad

  ];


    home-manager.users.${config.my.username}={
      programs={
        java.enable = true;
        git.enable = true;
        lazygit.enable = true;
        ripgrep.enable = true; # For doom-emacs
        neovim ={
          enable = true;
          vimAlias = true;
          vimdiffAlias = true;
          withNodeJs = true;
        };


    };

      #programs.doom-emacs = {
        #  enable = true;
        #};
  };
  virtualisation.docker.enable = true;

  };
}

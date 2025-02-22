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

      pkgs.ostree
      #Docker
      pkgs.lazydocker
      pkgs.arduino
      pkgs.jetbrains.idea-ultimate
      pkgs.jetbrains.datagrip

      # Languages
      pkgs.shellcheck
      pkgs.filezilla
      pkgs.nixd
      pkgs.nil
      pkgs.python3
      pkgs.pipx
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
      pkgs.jetbrains-toolbox
  ] ++ optionals cfg.enable [

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

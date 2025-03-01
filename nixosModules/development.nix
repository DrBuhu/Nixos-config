{inputs, lib,  pkgs,  config, ... }:

let
  cfg = config.my.desktop;
  system = "x86_64-linux";
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
  users.users.unwary = {
    extraGroups = [ "libvirtd" ];

  };
    environment.systemPackages = [


      pkgs.ostree
      pkgs.ninja
      #Docker
      pkgs.lazydocker
      pkgs.arduino
      pkgs.cmake
      pkgs.jetbrains.idea-ultimate
      pkgs.jetbrains-toolbox
      pkgs.jetbrains.datagrip

      # Languages
      pkgs.shellcheck
      pkgs.filezilla
      pkgs.nixd
      pkgs.nil
      pkgs.python3
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
  virtualisation.libvirtd.qemu = {
    swtpm.enable = true;
    ovmf.packages = [ pkgs.OVMFFull.fd ];
  }  ;

  # Enable USB redirection (optional)
  virtualisation.spiceUSBRedirection.enable = true;

  };
}

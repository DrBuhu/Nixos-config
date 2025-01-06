{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg-desktop = config.my.desktop.my.desktop.enableDesktopSpecific;
  cfg-universial = config.my.desktop.enableUniversial;
in
{
  imports = [
    ../softwareconf/doom-emacs.nix
    ../softwareconf/nvim.nix
  ];

  options.my.desktop = {
    enableDesktopSpecific = lib.mkEnableOption "Desktop";
    enableUniversial = lib.mkEnableOption "Universial";
  };
  config = lib.mkMerge [
    (lib.mkIf cfg-universial.enable {

      environment.systemPackages = lib.attrValues {
        inherit (pkgs)
          jetbrains-toolbox
          vscodium-fhs
          mariadb
          nodejs
          jdk11
          jdk
          google-java-format
          jdt-language-server
          ;
      };

      #nix.nixPath = [ "nixpkgs = $(inputs.nixpkgs)" ];
      #home-manager.users.${config.my.username} = {
      #  programs = {
      #    neovim.enable = true;
      #    java.enable = true;
      #  };

      #  #programs.doom-emacs = {
      #  #  enable = true;
      #  #};
      #};

      #virtualisation.docker.enable = true;

    })
    (lib.mkIf (cfg-universial.enable && cfg-desktop.enable) {
#      environment.systemPackages = lib.attrValues {
#        inherit (pkgs)
#          # Docker
#          lazydocker
#          # Lanuages
#
#          ## DOOM - Emacs
#          shellcheck
#          nixd # Nix-Lsp
#          nil
#          alejandra # Nix-Formatting
#          nixfmt
#
#          ## Python
#          python3
#          pipx
#          uv
#
#          ;
#      };
#      nix.nixPath = [ "nixpkgs = $(inputs.nixpkgs)" ];
#      home-manager.users.${config.my.username} = {
#        programs = {
#          lazygit.enable = true;
#          ripgrep.enable = true; # For doom-emacs
#        };

        #programs.doom-emacs = {
        #  enable = true;
        #};
#      };

    })
  ];

}

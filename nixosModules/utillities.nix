
{inputs, pkgs, config,lib,... }:
  

{
  imports =
  [ # programs that need extra config
    ../softwareconf/fish.nix
    ../softwareconf/git.nix
    ../softwareconf/zellij.nix
    ../softwareconf/virtualisation.nix
    ];
  config={
    programs.virt-manager.enable = true;
    environment.systemPackages = [

      pkgs.ghostty

      pkgs.xclip #neovim copy
      pkgs.wget
      pkgs.jq


      pkgs.github-desktop
#      pkgs.appimage-run
      pkgs.lutris
      pkgs.wine
      pkgs.winetricks
      pkgs.cabextract
      pkgs.distrobox
      pkgs.flatpak
      pkgs.flatpak-builder


      pkgs.bitwarden
      pkgs.webtorrent_desktop
      pkgs.qalculate-qt

      pkgs.nix-du # for system optimisation
      pkgs.manix # for looking up pkgs/options

      pkgs.fastfetch

      pkgs.#Screenshot
      pkgs.flameshot
      pkgs.shutter

      pkgs.thermald # for fan checking


      pkgs.nodePackages.npm
      pkgs.xhosts #Todo what is that?

      pkgs.zlib
    ];

    home-manager.users.${config.my.username}= {
      programs = {
        tmux.enable = true;
        fish.enable = true;
        kitty.enable = true;
        zoxide.enable = true;
        fzf.enable = true;
        git.enable = true;
        gh.enable = true;
        lazygit.enable = true;
        zellij.enable = true;
        yazi.enable = true;
        btop.enable = true;
        fd.enable = true;
        pandoc.enable = true;

    };
    services.kdeconnect.enable = true;
  };


      programs.fish.enable = true;
      environment.shells =  [pkgs.fish pkgs.bash pkgs.zsh];
      users.users.unwary.shell = pkgs.fish;

      services.flatpak.enable = true;
  };


}

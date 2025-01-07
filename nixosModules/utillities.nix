
{inputs, pkgs, config,lib,... }:
  

{
  imports =
  [ # programs that need extra config
    ../softwareconf/fish.nix
    ../softwareconf/git.nix
    ../softwareconf/zellij.nix

    ];
  config={
    environment.systemPackages = [


      pkgs.xclip #neovim copy
      pkgs.wget


      pkgs.github-desktop
      pkgs.
      pkgs.lutris
      pkgs.wine
      pkgs.winetricks
      pkgs.cabextract
      pkgs.distrobox

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
    ];

    home-manager.users.${config.my.username}= {
      programs = {
        tmux.enable = true;
        fish.enable = true;
        kitty.enable = true;
        zoxide.enable = true;
        fzf.enable = true;
        git.enable = true;
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
  };
}

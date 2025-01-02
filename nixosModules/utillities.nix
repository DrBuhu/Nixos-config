
{inputs, pkgs, config,lib,... }:
let
  hm-programs = "{home-manager.users.${config.my.username}.programs}";
  
in

{
  imports =
  [ # programs that need extra config
    ../softwareconf/fish.nix
    ../softwareconf/git.nix
  ];

    environment.systemPackages = lib.attrValues {
      inherit
      (pkgs)
        xclip #neovim copy
        wget	
        alejandra #Nix-Formatting
        nixd #Nix LSP

        github-desktop
        
        lutris
        wine
        winetricks
        cabextract

        bitwarden
        webtorrent_desktop
        qalculate-qt

        nodejs


       ;
       inherit
       (pkgs.nodePackages)
        npm

      ;
      inherit
       (pkgs.xorg)
        xhost
      ;
    };
 


  home-manager.users.${config.my.username}={
    programs.tmux.enable = true;
    programs.fish.enable = true;
    programs.kitty.enable = true;
    programs.zoxide.enable = true;
    programs.fzf.enable = true;
    programs.git.enable = true;
    programs.lazygit.enable = true;
    programs.zellij.enable = true;
    programs.yazi.enable = true;
    programs.btop.enable = true;

    services.kdeconnect.enable = true;
      
    };

    
    programs.fish.enable = true;
    environment.shells =  [pkgs.fish pkgs.bash pkgs.zsh];
    users.users.unwary.shell = pkgs.fish;
}



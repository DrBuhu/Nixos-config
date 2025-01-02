
{inputs, pkgs, config,lib,... }:
  

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
      nix-du



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
}



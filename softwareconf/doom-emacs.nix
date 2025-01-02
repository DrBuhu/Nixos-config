{inputs,pkgs, config,  ... }:
{
  home-manager.users.${config.my.username}={
    programs.doom-emacs = {    
      doomDir = inputs.doom-config;  # or e.g. `./doom.d` for a local configuration
    };
    services.emacs.enable = true;

    programs = {
      emacs = {
        enable = false;
        package = pkgs.emacs29;
        extraPackages = epkgs: [
          epkgs.mu4e
          epkgs.vterm
          epkgs.pdf-tools
          epkgs.org-pdftools
        ];
      };
      ripgrep.enable = true;
    };
  };

   
}
 

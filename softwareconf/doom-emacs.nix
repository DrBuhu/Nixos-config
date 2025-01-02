{pkgs, config, ... }:
{
  home-manager.users.${config.my.username}={
    programs.doom-emacs = {    
      doomDir = .doom/doom-emacs-private;  # or e.g. `./doom.d` for a local configuration
    };
  };
}
 

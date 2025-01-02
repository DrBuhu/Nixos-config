{pkgs, config, ... }:
{
  home-manager.users.${config.my.username}={
    doomDir = inputs.doom-config;
  };
}
 

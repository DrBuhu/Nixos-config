{pkgs, config, ... }:
{
  home-manager.users.${config.my.username}={
    programs.zellij.settings ={
      theme = "dracula";
    };

  };
}

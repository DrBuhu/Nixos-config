{pkgs, lib, config, ... }:
{

  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      obsidian
    ;

  };

  home-manager.users.${config.my.username}={
  };
};

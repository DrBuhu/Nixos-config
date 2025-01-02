{pkgs, config, ... }:
{

  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
    ;

  };

  home-manager.users.${config.my.username}={
  };
};

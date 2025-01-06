{pkgs, config, ... }:

  let
  cfg = config.module;
  in
{
  options.module = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = lib.attrValues {
        inherit
        (pkgs)

        ;

      };

  };


  home-manager.users.${config.my.username}={
  };
};

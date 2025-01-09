{pkgs, lib, config, ... }:

{
  
  programs={
    steam.enable = true;
  };

  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      steam-run
      prismlauncher #minecraft-launcher
      asciiquarium
      #bsdgames
    ;
  };
}

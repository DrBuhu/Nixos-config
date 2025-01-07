{pkgs, lib, config, ...}:
  
## HOME-MANAGER
{
  options = {
    my = {
      username  = lib.mkOption {
        type = lib.types.str;
          default = "unwary";
        };
    };
  };
  config ={
    environment.systemPackages = [
      pkgs.home-manager
      pkgs.fw-ectool
      pkgs.nh
      pkgs.nix-output-monitor
      pkgs.nvd
      pkgs.rpm
      pkgs.dnf5
      pkgs.rPackages.yum
      pkgs.dnf-plugins-core
      pkgs.alsa-utils
      pkgs.pacman

  ];
  environment.sessionVariables = {
    FLAKE = "/etc/nixos";
  };


  home-manager ={
    useGlobalPkgs = true;
    useUserPackages = true;
    users.unwary={
          home.stateVersion = "24.11";
    };
    backupFileExtension = "backup";
    #sharedModules = [ inputs.nix-doom-emacs-unstraightened.hmModule ];

  };


  ## Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot


  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  
  #Optimization
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "15:45" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  };
}


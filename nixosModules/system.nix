{pkgs,
  lib,
  config,
  inputs,
  ...
}:
  
## HOME-MANAGER
{
  imports=[
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];
  options = {
    my = {
      username  = lib.mkOption {
        type = lib.types.str;
          default = "unwary";
        };
    };
  };

  config ={

      programs.hyprland.enable = true;
      xdg.portal.enable = true;
      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      environment.systemPackages = [
      	#pkgs.qtile-unwrapped
        pkgs.waybar
        pkgs.dunst
        pkgs.libnotify
        pkgs.swww
        pkgs.rofi-wayland
        pkgs.nwg-displays
        pkgs.networkmanagerapplet
        pkgs.overskride


        pkgs.kdePackages.qttools
        pkgs.dbus

        pkgs.home-manager
        pkgs.kdePackages.powerdevil
        pkgs.fw-ectool
        pkgs.nh
        pkgs.nix-output-monitor
        pkgs.nvd
        pkgs.rpm
        pkgs.dnf5
        pkgs.rPackages.yum
        pkgs.dnf-plugins-core
        pkgs.alsa-utils
        pkgs.alsa-lib
        pkgs.alsa-plugins
        pkgs.pacman
        pkgs.xbrightness
        pkgs.powerdevil
        pkgs.kdePackages.appstream-qt

        #Audio encoders:
        pkgs.faac
        pkgs.aften
        pkgs.celt
        pkgs.libmad
        pkgs.libmpcdec
        pkgs.libopus
        pkgs.libvorbis
        pkgs.opencore-amr
        pkgs.speex

        # Video Codecs
        # pkgs.aom?
        pkgs.rav1e
        pkgs.svt-av1

        #pkgs.davs2
        #pkgs.daala
        pkgs.schroedinger
        pkgs.libdv
        pkgs.x265
        pkgs.libde265
        pkgs.x264

        pkgs.libmpeg2
        pkgs.xvidcore
        pkgs.libtheora
        pkgs.libvpx
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
    #inputs.nixos-hardware.nixosModules.framework-13-7040-amd.audioEnhancement.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };

#  services.pipewire.enable = false;
#  hardware.pulseaudio.enable = true;
#  hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
#  users.extraUsers.unwary.extraGroups = [ "audio"  ];
#  nixpkgs.config.pulseaudio = true;

    ## Printing
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
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

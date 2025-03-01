{ pkgs, config, ... }:

let
  newsony = pkgs.sony-headphones-client.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Plutoberth";
      repo = "SonyHeadphonesClient";
      rev = "e330d989016bfe4075e8df1bbcd1abc8c4f8b58d";
      hash= "sha256-ZeujsyT5FgAhdjfgGMVuC5Q9agMKYeGPEycbEzfFZ2Y=";
      fetchSubmodules = true;
    };
    patches = [];
  });
in

{
  imports = [];

  environment.systemPackages =[
    pkgs.audacity # Recoder/sound editor
    pkgs.vlc
    pkgs.mpd
    pkgs.eartag
    pkgs.rsgain
    pkgs.lidarr
    pkgs.beets
    pkgs.tageditor


#    pkgs.tauon ## Music Player installed with flatpak
    pkgs.grimblast
    pkgs.puddletag
    pkgs.picard
    pkgs.picard-tools
    pkgs.kid3-qt
    pkgs.beets
    pkgs.kid3-cli
    pkgs.easytag
    pkgs.playerctl
    newsony

  ];

  home-manager.users.${config.my.username} = {
	programs.beets.enable = true;
  };
}

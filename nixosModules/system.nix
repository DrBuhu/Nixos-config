{pkgs, lib, config, inputs, ...}:
  
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
              pkgs.nh
              pkgs.nix-output-monitor
              pkgs.nvd

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
            sharedModules = [ inputs.nix-doom-emacs-unstraightened.hmModule ];

          };


        

          ## Bluetooth
          hardware.bluetooth.enable = true; # enables support for Bluetooth
          hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot


	};
}


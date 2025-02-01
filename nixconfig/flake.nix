
{

  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    ghostty = { url = "github:ghostty-org/ghostty"; };
    #stylix.url = "github:danth/stylix/release-24.11";
    #
    focal = {
        url = "github:iynaix/focal";
        inputs.nixpkgs.follows = "nixpkgs"; # override this repo's nixpkgs snapshot
    };
    home-manager = {

      url = "github:nix-community/home-manager/release-24.11";
        # The `follows` keyword in inputs is used for inheritance.
        # Here, `inputs.nixpkgs` of home-manager is kept consistent with
        # the `inputs.nixpkgs` of the current flake,
        # to avoid problems caused by different versions of nixpkgs.

      inputs.nixpkgs.follows = "nixpkgs";

    };


#    nixpkgs-old-davinci.url = "github:nixos/nixpkgs/commit/7e90bfdbcbcfeb0c98c7d4ee59ac6d316a79e029";
    #nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    # Optional, to download less. Neither the module nor the overlay uses this input.
    #nix-doom-emacs-unstraightened.inputs.nixpkgs.follows = "";
    #doom-config = {
    #  url = "github:hlissner/.doom.d";
    #  flake = false;
    #};

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    affinity-nix.url = "github:mrshmllow/affinity-nix";

  };




  outputs = inputs @ {
    nixpkgs,
    home-manager,
    affinity-nix,
    ghostty,
    nixos-hardware,
    focal,
    #stylix,
#    nixpkgs-old-davinci,
   #nix-doom-emacs-unstraightened,
   #doom-config,
   ...
  }: {
  
  nixpkgs.config.allowUnfree = true;

    homeConfigurations = {
      "unwary" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
	  extraSpecialArgs = {inherit inputs;}; 
	  #(inputs)doom-emacs
	  modules = [
          #inputs.nix-doom-emacs-unstraightened.hmModule
          #inputs.doom-config
          nixos-hardware.nixosModules.framework-13-7040-amd
          {

              

              home.packages = 
              [
                inputs.focal.packages.x86_64-linux.default
                inputs.affinity-nix.packages.x86_64-linux.photo
                inputs.affinity-nix.packages.x86_64-linux.designer
                inputs.affinity-nix.packages.x86_64-linux.publisher
              ];

            }

          #stylix.nixosModules.stylix ./nixosModules/system.nix
  	  ];
      };
    };

	  environment.systemPackages =[
      inputs.focal.packages.x86_64-linux.default
    ];

	nixosConfigurations.unwary = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs; };
    modules = [
      ./host/fw-laptop/configuration.nix
    ];
	};
  };
}

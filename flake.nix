
{

  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    ghostty = { url = "github:ghostty-org/ghostty"; };
  home-manager = {

      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.

      inputs.nixpkgs.follows = "nixpkgs";
  };

    nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    # Optional, to download less. Neither the module nor the overlay uses this input.
    nix-doom-emacs-unstraightened.inputs.nixpkgs.follows = "";
  };

  inputs.affinity-nix.url = "github:mrshmllow/affinity-nix";

    


outputs = inputs @ {
   nixpkgs,
   home-manager, 
   affinity-nix,
   ghostty,
   nix-doom-emacs-unstraightened,
   ...
  }: {
  
  nixpkgs.config.allowUnfree = true;

    homeConfigurations = {
      "unwary" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
	  extraSpecialArgs = {inherit (inputs) doom-emacs;};
	  modules = [
          inputs.nix-doom-emacs-unstraightened.hmModule

            {
              

              home.packages = 
              [
                inputs.affinity-nix.packages.x86_64-linux.photo
                inputs.affinity-nix.packages.x86_64-linux.designer
                inputs.affinity-nix.packages.x86_64-linux.publisher
              ];

            }
  	  ];
      };
    };
	    

	nixosConfigurations.unwary = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs; };
	modules = [
	   ./host/fw-laptop/configuration.nix
	];
	};
  };
}

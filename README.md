# Setting up

## Git
softwareconfig/git.nix change credentials
sudo mkdir .git
sudo chown unwary:users .git
(username:users)

## Cloned
git remote rm orign
git remote add github ssh-url
git remote github



# Lookup 

Use: https://mynixos.com/
For:
## Homemanager
    package + home-manager
    
## System-level
nixpkgs/option


# Commands
## Update Flake:

## nix flake update:

Update System
sudo nixos-rebuild switch --flake .#name of config if not hostname





# Errors

## No flake found - Git init
error: path '/nix/store/0ccnxa25whszw7mgbgyzdm4nqc0zwnm8-source/flake.nix' does not exist

when initilising git, this error can appear to fix either:

 delete .git

## getting status of no such file or directory
stage files




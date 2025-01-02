{pkgs,lib, ... }:

{


  imports =
    [ 
    ];




  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      maxima
      wxmaxima
    ;
  };




}


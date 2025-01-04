{pkgs,lib, ... }:

{


  imports =
    [ 
    ];




  environment.systemPackages = lib.attrValues {
    inherit
    (pkgs)
      anki
      maxima
      wxmaxima
    ;
  };




}


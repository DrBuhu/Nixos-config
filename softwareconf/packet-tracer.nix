{ pkgs, lib }:
pkgs.stdenv.mkDerivation rec {
  pname = "cisco-packet-tracer";

  src = builtins.requireFile {
    url = "https://www.oracle.com/java/technologies/javase-jdk11-downloads.html";
  };

  doCheck = false;

  dontUnpack = true;

  installPhase = ''
    nix-store --add-fixed sha256 CiscoPacketTracer822_amd64_signed.deb   
  '';
}

{pkgs, config,...}:
{
  home-manager.users.${config.my.username}={
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
    };
  };
  virtualisation.libvirtd.enable = true;
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  users.users.${config.my.username}.extraGroups = [ "libvirtd" ];



}

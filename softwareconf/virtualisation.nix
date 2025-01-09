{pkgs, config,...}:
{
  home-manager.users.${config.my.username}={
    programs.virt-manager.enable = true;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
    };
  };

  users.users.${config.my.username}.extraGroups = [ "libvirtd" ];



}

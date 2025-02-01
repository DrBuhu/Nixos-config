{config, ...}:
{

  home-manager.users.${config.my.username}={
    programs.git ={
      userName = "unwary";
      userEmail = "codeberg.hamburger849@simplelogin.com";
      extraConfig = {
      	init.DefaultBranch = "main";
        # Allow to commit to different ownership/ root
        safe.directory = "/etc/nixos";
      };
    };
  };
    
}

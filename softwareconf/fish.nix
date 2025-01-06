{config, ...}:
{

  home-manager.users.${config.my.username}={
    programs.fish = {

      interactiveShellInit = ''
        set -gx EDITOR doom run
        set fish_greeting 
        zoxide init fish | source
        fish_add_path ~/.config/emacs/bin
      '';

      shellAliases = {
        se = "sudoedit";
      };

    };
    };


}

{pkgs, config, ... }:
{
home-manager.users.${config.my.username}={
        programs.neovim.extraConfig = ''
                nmap H ^
                nmap L $
		set clipboard=unnamed
		filetype plugin indent on
		autocmd FileType nix setlocal shiftwidth=2 softtabstop=2 expandtab

		
        '';
};
}

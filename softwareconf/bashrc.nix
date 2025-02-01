{
	programs.bash.bashrcExtra = {
		export EDITOR=nvim
		 if [ -z "$TMUX" ]; then
   			tmuxinator default          
 		fi                     

	}
}

#bashrc loading
if [ -r ~/.bashrc ]; then
	# shellcheck disable=SC1090
	. ~/.bashrc
fi

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git

# Set terminal tab width to 2
tabs -2

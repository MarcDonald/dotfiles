#bashrc loading
if [ -r ~/.bashrc ]; then
	# shellcheck disable=SC1090
	. ~/.bashrc
fi

# Set terminal tab width to 2
tabs 2

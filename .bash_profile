#bashrc loading
if [ -r ~/.bashrc ]; then
  # shellcheck disable=SC1090
  . ~/.bashrc
fi

# Set terminal tab width to 2
tabs 2

export VISUAL=vim
export EDITOR="$VISUAL"

export PATH="$HOME/.cargo/bin:$PATH"

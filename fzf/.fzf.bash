# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/benstoutenburgh/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/benstoutenburgh/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/benstoutenburgh/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/benstoutenburgh/.fzf/shell/key-bindings.bash"


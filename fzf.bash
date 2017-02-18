# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dennis/.fzf/bin* ]]; then
  export PATH="$PATH:/home/dennis/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dennis/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/dennis/.fzf/shell/key-bindings.bash"


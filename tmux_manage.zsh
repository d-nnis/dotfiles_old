#!/usr/bin/env zsh

## tmux automatic switching

# always start a new session
# give information about existing sessions
# give hint how to switch to existing session
# destroy left session
tmux_aware() {
  if [[ -z $TMUX ]]; then
    tmux -2
  else  
    sessions=$(tmux ls | awk '{print $1}' | sed 's/://')
    num_sessions=$(echo $sessions | wc -l)
    
    if [[ $num_sessions > 1 ]]; then
      echo "tmux sessions:"
      tmux ls
      echo "tmux at [-t#] to attach to last [/#] session"
    fi
fi
#      mux new-session -d -s "$tmux_session" \; \
#           set-option -t "$tmux_session" destroy-unattached off &> /dev/null
#      # Attach to the 'prezto' session or to the last session used.
#            exec tmux $_tmux_iterm_integration attach-session
}


# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
echo ".bash_profile execute"
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"

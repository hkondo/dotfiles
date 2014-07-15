# use MacVim
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# export
export LANG=ja_JP.UTF-8
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/texbin:$PATH"
export RBENV_ROOT="/usr/local/var/rbenv"
eval "$(rbenv init -)"

# alias
setopt complete_aliases # aliased ls needs if file/dir completions work
alias ls="ls -G"
alias gls="gls --color"

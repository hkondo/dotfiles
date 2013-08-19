# export
export LANG=ja_JP.UTF-8
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export RBENV_ROOT="/usr/local/var/rbenv"
eval "$(rbenv init -)"

# alias
setopt complete_aliases # aliased ls needs if file/dir completions work
alias ls="ls -G"
alias gls="gls --color"

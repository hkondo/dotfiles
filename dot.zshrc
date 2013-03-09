# misaki's .zshrc

# LANG
export LANG=ja_JP.UTF-8

# prompt
autoload colors
colors
PROMPT="
[%n@%m:%{${fg[yellow]}%}%~%{${reset_color}%}]
$ "
PROMPT2='[%n]> '
RPROMPT="%1(v|%F{green}%1v%f|)"
SPROMPT="%r is correct? [n,y,a,e]: "

# terminal's title
# including current directory
precmd() {
  echo -ne "\033]0;${USER}@MBA:${PWD}\007"
}

# bindkey
bindkey -v

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# auto change directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
# command correct edition before each completion attempt
setopt correct
# compacked complete list display
setopt list_packed
# no beep sound when complete list displayed
setopt nolistbeep
# no remove postfix slash of command line
setopt noautoremoveslash

# completion configuration
autoload -U compinit
compinit

# alias
setopt complete_aliases # aliased ls needs if file/dir completions work
alias ls="ls -G"
alias gls="gls --color"

# terminal configuration
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
case "${TERM}" in
  kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@MBA:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
  'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

# load user .zshrc configuration file
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

function _update_vcs_info_msg() {
psvar=()
LANG=en_US.UTF-8 vcs_info
[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

add-zsh-hook precmd _update_vcs_info_msg


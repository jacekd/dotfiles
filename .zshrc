setopt prompt_subst
autoload colors
colors

# Environment variables
export EDITOR="vim"
#export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export ACK_COLOR_MATCH="red"
export WORDCHARS='*?[]~&;!$%^<>'

# VI mode enable and indicator on prompt
bindkey -v
function zle-line-init zle-keymap-select {
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  RPS2=$RPS1
    zle reset-prompt
  }
zle -N zle-line-init
zle -N zle-keymap-select

# cd .. function 
function ..() {
  arg=${1}
  dir=""
  while (( arg > 0 )); do
    dir="../${dir}"
    arg=$((${arg}-1))
  done
  cd $dir
}

# command correction
setopt correct

# aliases
alias ls="ls --color=auto"
alias ll="ls -al"
#alias ..="cd .."
alias -g gp="| grep"
alias -g tl="| tail"
alias -s php=vim
alias -s js=vim
alias -s scss=vim
alias -s pdf=zathura
alias -s zip=unzip
alias -s log="less -Mn"
alias s="git status"
alias c="git commit -am"

# sourcing
source ~/.zsh/zsh-prompt/zsh-prompt.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# path extension
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# java settings 
export _JAVA_OPTIONS='-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

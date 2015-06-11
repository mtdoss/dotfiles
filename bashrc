export PATH="$PATH:~/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export LEXILE_USERNAME="Curriculet"
export LEXILE_PASSWORD="Pmfct78!"
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

 [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

bind -r '\C-s' # ??
stty -ixon

# allows for git completion
# source: http://code-worrier.com/blog/autocomplete-git/
# (you need to have the git completion script in home directory)
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Makes prompt red with git branch
export PS1="\[\e[1;31m\]\h:\W \u\$(parse_git_branch)\\$ \[\e[0m\]"

export PATH="$PATH:~/bin"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

HISTCONTROL=ignoreboth
alias gs='git status'
alias gad='git add -A'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gdm='git diff master'
alias gco='git checkout '
alias rrw='echo -ne "\033]11;#800000\007"; rake resque:work'

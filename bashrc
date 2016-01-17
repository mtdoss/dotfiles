export PATH="$PATH:~/bin"
# export PATH="$PATH:/path/to/elixir/bin"
export PATH="$HOME/.rbenv/bin:$PATH"

export LEXILE_USERNAME="Curriculet"
export LEXILE_PASSWORD="Pmfct78!"
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

 [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

bind -r '\C-s' # ??
stty -ixon


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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
export PATH="$PATH:/usr/local/bin/git"
export PATH=$PATH:/Applications/Racket\ v6.2/bin
alias emacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw"

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Documents/AppAcademy
# source /usr/local/bin/virtualenvwrapper.sh

# Get rid of 'too many files are open' error
ulimit -S -n 4096

HISTCONTROL=ignoreboth
alias gs='git status'
alias gad='git add -A'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gp='git pull'
alias gdm='git diff master'
alias gdmn='git diff master --name-only'
alias gco='git checkout '
alias gcom='git checkout master'
alias grim='git rebase -i master'
alias hcuprod='heroku run rails c -a cuprod'
alias hcustag='heroku run rails c -a custag'
alias hadaprod='heroku run rails c -a adaprod'
alias hadastag='heroku run rails c -a adastag'
alias rrw='echo -ne "\033]11;#800000\007"; rake resque:work'

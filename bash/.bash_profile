#!/usr/bin/env bash

# shellcheck disable=1090
true

BREWPATH=$(brew --prefix)
export BREWPATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ${HOME}/.{path,exports,aliases,functions,bash_prompt}; do
  [ -r "$file" ] && . "$file"
done
unset file

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

if type shopt &> /dev/null; then
  # append to history file, don't overwrite
  shopt -s histappend

  # Save multi-line commands as one command
  shopt -s cmdhist

  # Case-insensitive globbing (used in pathname expansion)
  shopt -s nocaseglob

  # Auto-correct typos in path names when using `cd`
  shopt -s cdspell

  # Autocorrect on directory names to match a glob.
  shopt -s dirspell
fi

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Save and reload the history after each command finishes
# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Load the default .profile
# [ -s "$HOME/.profile" ] && . "$HOME/.profile"

# Load RVM into a shell session *as a function*
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

# z beats cd most of the time.
#  github.com/rupa/z
[ -s "${BREWPATH}/etc/profile.d/z.sh" ] && . "${BREWPATH}/etc/profile.d/z.sh"

# grc colorizing
[ -e "${BREWPATH}/etc/grc.bashrc" ] && . "${BREWPATH}/etc/grc.bashrc"

# include .bashrc if it exists
#[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# set up fzf keybindings
[ -f "${HOME}/.fzf.bash" ] && . "${HOME}/.fzf.bash"

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# asdf
[ -f "${BREWPATH}/opt/asdf/asdf.sh" ] && source "${BREWPATH}/opt/asdf/asdf.sh"

##
## Completion
##

# system bash completion
# this will also get local completion scripts stored in ${HOME}/.bash_completion.d if using .bash_complete
[ -f "/etc/bash_completion" ] && . /etc/bash_completion

# enable homebrew bash_completion
[ -r "${BREWPATH}/etc/profile.d/bash_completion.sh" ] && . "${BREWPATH}/etc/profile.d/bash_completion.sh"

# enable aws-cli completion
[ -f "${BREWPATH}/bin/aws_completer" ] && complete -C aws_completer aws

# enable rvm completion
# shellcheck disable=2154
[ -r "$rvm_path/scripts/completion" ] && . "$rvm_path/scripts/completion"

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
# commented out in favor of downloading http://brettterpstra.com/2012/06/16/bash-completion-for-defaults-domains/
# complete -W "NSGlobalDomain" defaults

# travis completion
[ -f "$HOME/.travis/travis.sh" ] && . "$HOME/.travis/travis.sh"

##
## Extra
##

# source extra last for overrides
[ -r "${HOME}/.extra" ] && . "${HOME}/.extra"

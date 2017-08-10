#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\$ '

bind 'set completion-ignore-case on'
complete -cf sudo

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -AFl'

calc ()
{
  (( d = $1 ))
  echo $d
}

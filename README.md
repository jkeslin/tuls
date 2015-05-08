# tuls_practice
-------

##Hey Meg, Here's some stuff to learn!
-------
###Getting Started

1. Open your terminal and navigate to the root directory like so:
```bash
$ cd
```
2.  Open your bash profile
```bash
$ open .bash_profile
```
3.  Paste the following into it and save.  Then re-open your terminal window.
```bash
alias ls='ls -GFh'

alias be="bundle exec"

alias dt='cd ~/Desktop'

alias subl='open -a "Sublime Text 2"'

alias f='open -a Finder ./'

alias which='type -all'

alias myip='curl ip.appspot.com'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '
```

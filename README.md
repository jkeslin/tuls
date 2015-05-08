# tuls_practice


##Hey Meg, Here's some stuff to learn!

###Getting Started

Open your terminal and navigate to the root directory like so:
```bash
$ cd
```
Open your bash profile
```bash
$ open .bash_profile
```
Paste the following into it and save.  Then re-open your terminal window.
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

Then play with these aliases as you see fit.  for example, type in your terminal (not including the dollar sign):

```bash
$ myip
```

it should tell you your ip address

##Practicing Git

Clone this remote repository by copying the url to the right and copying it into the terminal with the words 'git clone' in front. It should look like this:

```bash
$ git clone https://github.com/jkeslin/tuls_practice.git
```

then 'cd' into the repository, which you've now created a 'local' copy of on your computer.
```bash
$ cd tuls_practice
```
then make some edits and play around with the file meg_practice.rb. You can now open this entire folder in sublime text by typing:
```bash
$ subl .
```
then make some changes and some commits and push it back up to the 'remote' repository like so:
```bash
$ git push origin master
```
(in the future you will often NOT push to the master branch.  You'll make your own branch and write commits and then push up your branch, and your collaborators will merge it with master after reviewing it. But this is fine for now.)

After you've made some commits, do a git log and look at the commit history you should see some commits from me and your commits as well.
```bash
$ git log
```
you can also do a git diff and it'll show you the differences between commits
```bash
git diff
```

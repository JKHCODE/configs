# Function to show git branch in terminal prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/>(\1)/'
}

# Same has above, but without ">" and surounding parens.
# This is used for git commits that require naming origin branch
gitbr() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Set PATH and environment variables
export PATH=/Users/jhyer/.pyenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/pycodestyle
export PYSPARK_DRIVER_PYTHON=ipython
# export SPARK_HOME=/Users/jhyer/git/rocket-backend/scoring/venv/lib/python3.6/site-packages/pyspark
export PATH=$PATH:/Users/jhyer/bin
# export VIRTUALENV_TEST_VAR=~/git/rocket-backend/scoring/venv/lib
# prompt formatting
export PS1="\[\033[01;35m\]\u\[\033[m\]:\[\033[36;1m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\]$"
# terminal output coloring
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# set aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias rr='rm -rf'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

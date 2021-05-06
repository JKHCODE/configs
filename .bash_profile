# Function to show git branch in terminal prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/>(\1)/'
}

# Same has above, but without ">" and surounding parens.
# This is used for git commits that require naming origin branch
gitbr() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Function to forward port 4040 
kcpf() {
    kubectl port-forward $1 4040
}

# Function to kill kubectl jobs listening to port 4040
kcpfk() {
  lsof -nPi :4040 | awk '{if($1 == "kubectl"){print $2; exit}}' | xargs kill -9
}

# Set PATH and environment variables
#export PATH=/Users/jhyer/.pyenv/shims:
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/pycodestyle

export PYSPARK_DRIVER_PYTHON=ipython
# export SPARK_HOME=/Users/jhyer/git/rocket-etl/scoring/venv/lib/python3.6/site-packages/pyspark
export PATH=$PATH:/Users/jhyer/bin
# export VIRTUALENV_TEST_VAR=~/git/rocket-backend/scoring/venv/lib

# prompt formatting
export PS1="\[\033[01;35m\]\u\[\033[m\]:\[\033[36;1m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\]$"

# terminal output coloring
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Avoid error when using Spark loacally
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Needed for homebrew to link to Mac OS OpenSSL
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# git tab completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

# set aliases
alias ls='ls -GFh'
alias ll='ls -la'
alias rr='rm -rf'
alias bsp='bash build.sh spark jhyer-1'
alias bpy='bash build.sh python jhyer-1'
alias kpods='kubectl get pods'
alias kjobs='kubectl get jobs'
alias kc='kubectl'
alias kcc='kubectl create -f'
alias kcd='kubectl delete -f'

# Add npm to $PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add pyenv shims to $PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# The next line updates PATH for the Google Cloud SDK.
source '/Users/petur/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/petur/google-cloud-sdk/completion.bash.inc'

export CLOUDSDK_PYTHON_SITEPACKAGES=1

export PATH=$HOME/work/arcanist/bin:$PATH

export PATH=$HOME/google-cloud-sdk/platform/google_appengine:$PATH

source $HOME/work/arcanist/resources/shell/bash-completion

source $HOME/.bashrc

export EDITOR=vim

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
eval $(thefuck --alias)

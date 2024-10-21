ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="ln"
prompt_context(){}


# Useful oh-my-zsh plugins
plugins=(git gitfast last-working-dir common-aliases history-substring-search pyenv docker docker-compose ssh-agent direnv)

# (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed (to manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv (to manage your Python versions)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # https://github.com/pyenv/pyenv-virtualenv/issues/135
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && RPROMPT+='[🐍 $(pyenv_prompt_info)]'

# Load nvm (to manage your node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set ipdb as the default debugger when using `breakpoint()` in Python (new in 3.7)
export PYTHONBREAKPOINT=ipdb.set_trace

export BUNDLER_EDITOR=code
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/ln/dev/go/bin:$PATH"

# Created by `pipx` on 2024-03-15 21:13:41
export PATH="$PATH:/Users/ln/.local/bin"
# Created by `pipx` on 2024-10-07 12:39:19 on remote VM
export PATH="$PATH:/home/alexis.gourdol/.local/bin"

#mysql server
export PATH="$PATH:/usr/local/mysql/bin"
export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"

export SPARK_HOME=/home/alexis.gourdol/spark/spark-3.5.3-bin-hadoop3
export PATH=$PATH:$SPARK_HOME/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


# show only last 3 parent directories as per https://github.com/agnoster/agnoster-zsh-theme/issues/19#issuecomment-1159333809
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%3~'
}


#add a newline to the prompt as per https://stackoverflow.com/questions/41017917/add-newline-to-oh-my-zsh-theme Felix Dombek's answer
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n%{%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%f%}"
  CURRENT_BG=''
}

ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="agnoster"
DEFAULT_USER="ln"
prompt_context(){}

# Useful oh-my-zsh plugins for Le Wagon bootcamps
# To solve "[oh-my-zsh] plugin 'zsh-syntax-highlighting' not found" => removed zsh-syntax-highlighting as per https://github.com/ohmyzsh/ohmyzsh/issues/7690
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
# commenting out export PATH => https://github.com/lewagon/dotfiles/commit/f61c2b106ca50e5e4701081a5d7043c54a8f4734?branch=f61c2b106ca50e5e4701081a5d7043c54a8f4734&diff=split
# export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # https://github.com/pyenv/pyenv-virtualenv/issues/135
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && RPROMPT+='[🐍 $(pyenv_prompt_info)]'

# Load nvm (to manage your node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Call `nvm use` automatically in a directory with a `.nvmrc` file
# autoload -U add-zsh-hook
# load-nvmrc() {
#   if nvm -v &> /dev/null; then
#     local node_version="$(nvm version)"
#     local nvmrc_path="$(nvm_find_nvmrc)"

#     if [ -n "$nvmrc_path" ]; then
#       local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#       if [ "$nvmrc_node_version" = "N/A" ]; then
#         nvm install
#       elif [ "$nvmrc_node_version" != "$node_version" ]; then
#         nvm use --silent
#       fi
#     elif [ "$node_version" != "$(nvm version default)" ]; then
#       nvm use default --silent
#     fi
#   fi
# }
# type -a nvm > /dev/null && add-zsh-hook chpwd load-nvmrc
# type -a nvm > /dev/null && load-nvmrc

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
#export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set ipdb as the default debugger when using `breakpoint()` in Python (new in 3.7)
export PYTHONBREAKPOINT=ipdb.set_trace

#export PYTHONPATH="/Users/alexisgourdol/code/alexisgourdol/data-challenges-745/04-Decision-Science:$PYTHONPATH"
#export PYTHONPATH="/Users/alexisgourdol/code/alexisgourdol/sandbox/lewagon-project:$PYTHONPATH"
#export PYTHONPATH="/Users/alexisgourdol/code/alexisgourdol/data-challenges-555/04-Decision-Science:$PYTHONPATH"
#export PYTHONPATH="/Users/alexisgourdol/code/alexisgourdol/IIPE-data:$PYTHONPATH"
export BUNDLER_EDITOR=code

export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

## Lumd exports
#export GOPATH=$HOME/dev/go
#export GOBIN=$GOPATH/bin
#export GO111MODULE=on
#export PATH=$PATH:$GOBIN

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/ln/dev/go/bin:$PATH"


#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Created by `pipx` on 2024-03-15 21:13:41
export PATH="$PATH:/Users/ln/.local/bin"

#mysql server
export PATH="$PATH:/usr/local/mysql/bin"
export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"

#add a newline to the prompt
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n%{%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%f%}"
  CURRENT_BG=''
}

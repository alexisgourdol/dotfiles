####################################################################
########################## OH-MY-ZSH ##############################
####################################################################
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="ln"
prompt_context(){}

plugins=(git gitfast last-working-dir common-aliases history-substring-search pyenv docker docker-compose ssh-agent direnv)

# (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/raw/master/docs/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

####################################################################
########################## TERMINAL ################################
####################################################################
# Encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Store your own aliases in the ~/.aliases file and load them here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# show only last 3 parent directories as per https://github.com/agnoster/agnoster-zsh-theme/issues/19#issuecomment-1159333809
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%3~'
}

# add a newline to the prompt as per https://stackoverflow.com/questions/41017917/add-newline-to-oh-my-zsh-theme Felix Dombek's answer
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n%{%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%f%}"
  CURRENT_BG=''
}
# adjust blue and green
    # in VS code with https://www.reddit.com/r/vscode/comments/1dit1kc/comment/l96hovu/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
        # "workbench.colorCustomizations": {
        # "terminal.ansiBlue": "#77a8e6",
        # "terminal.ansiGreen": "#a3b637",
    # in iTerm : Settings > Profile > Color

####################################################################
########################## HOMEBREW ################################
####################################################################
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

####################################################################
########################## PYTHON ##################################
####################################################################
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH" # switch to updated pyenv installed with brew l 48
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # https://github.com/pyenv/pyenv-virtualenv/issues/135
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && RPROMPT+='[🐍 $(pyenv_prompt_info)]'
eval "$(pyenv init --path)"

# Set ipdb as the default debugger when using `breakpoint()` in Python (new in 3.7)
export PYTHONBREAKPOINT=ipdb.set_trace

####################################################################
########################## GO ######################################
####################################################################
# Go tools installed by VS Code extension
export PATH="/Users/ln/dev/go/bin:$PATH"

# Go workspace bin (for manually installed Go binaries)
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

####################################################################
########################## MYSQL ###################################
####################################################################
export PATH="$PATH:/usr/local/mysql/bin"

####################################################################
########################## LOCAL BIN ###############################
####################################################################
# Created by `pipx` on 2024-03-15 21:13:41
export PATH="$PATH:/Users/ln/.local/bin"

####################################################################
########################## AI / API KEYS ###########################
####################################################################
export ANTHROPIC_API_KEY=$(awk 'NR==1' ~/.claude/api_key)

####################################################################
########################## OBSIDIAN ################################
####################################################################
# Define the base directory for Obsidian notes
obsidian_base="$HOME/code/alexisgourdol/obsidian-synch/01-zettlekasten"
# Define the default directory for notes generated via youtube-summarizer
export YTSUM_SAVE_DIR="$HOME/code/alexisgourdol/obsidian-synch/01-zettlekasten"

####################################################################
########################## DOTFILES ################################
####################################################################
# Get the directory where this .zshrc file is located
DOTFILES_DIR="${${(%):-%x}:A:h}"

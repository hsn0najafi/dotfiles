ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode disabled
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

plugins=(
	git
	zsh-autosuggestions     # https://github.com/zsh-users/zsh-autosuggestions.git
	zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting.git
)

source /Users/r00t/.oh-my-zsh/oh-my-zsh.sh

export EDITOR="nvim"

alias l="ls -trhFs"
alias a="ls -trhFas"
alias ll="ls -ltrhFs"
alias la="ls -ltrhFas"
alias t="tree -aFI 'node_modules|public|dist|data|.git'"
alias tl="tree -aFIL 'node_modules|public|dist|.git'"
alias c="clear"
alias e="exit"
alias nm="find . -name 'node_modules' -type d -prune"
alias prune="docker container prune && docker network prune && docker image prune && docker volume prune -a"
alias us="git submodule update --init --remote"
alias rc="docker compose up --build --force-recreate -V -d"
alias sc="docker ps -aq | xargs docker stop"
alias cl="claude"
alias cdx="codex"
# alias gwa="git worktree add . -b \"$(basename "$PWD")\""
#alias gwd="git worktree remove ."
alias vim="nvim"

#gwa() {
#  local b_name="$1"
#  if [ -z "$b_name" ]; then
#    b_name="z--$(printf "%04d" $((RANDOM % 10000)))--wt"
#  fi
#  mkdir -p "$b_name" && cd "$b_name" && git worktree add . -b "$(basename "$PWD")"
#}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
	local nvmrc_path="$(nvm_find_nvmrc)"
	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version="$(nvm version $(cat "$nvmrc_path"))"
		if [ "$nvmrc_node_version" != "$(nvm version)" ]; then
			nvm use
		fi
	elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
		nvm use default
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

. "$HOME/.local/bin/env"

fpath=(/Users/r00t/.docker/completions $fpath)
autoload -Uz compinit
compinit

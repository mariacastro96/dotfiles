# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# open SSL
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

export EDITOR=vim
export VISUAL=vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# postgresql
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/postgresql@11/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@11/include"

# aws
export DB_DECRYPTION_KEY="mEC4MK8DXSCF2hUvxCrkyP5eNZZr4k7f"

#asdf
. /usr/local/opt/asdf/libexec/asdf.sh
. /usr/local/opt/asdf/asdf.sh

# alias
alias legacy-no-sess="aws-vault exec master --no-session -- rake sync:redacted_db_sync"
alias legacy-no-sess-no-download="aws-vault exec master --no-session -- bundle exec rake sync:redacted_db_sync SKIP_DOWNLOAD_USE_LATEST=true"
alias legacy-get-id="aws-vault exec master -- aws sts get-caller-identity"
alias legacy="aws-vault exec master -- "
alias old-prod-access="aws-vault exec master -- scripts/rc_production"
alias bwstaging-get-id="aws-vault exec bwstaging -- aws sts get-caller-identity"
alias bwstaging-cons="aws-vault exec bwstaging -- scripts/exec_to_monolith_cluster"
alias bwstaging="aws-vault exec bwstaging -- "
alias bwprod-get-id="aws-vault exec bwproduction -- aws sts get-caller-identity"
alias bwprod-cons="aws-vault exec bwproduction -- scripts/exec_to_monolith_cluster"
alias aws-vault-configure-new="aws configure sso"
# bwstaging env - prints env variables
alias aws-clear="aws-vault clear"

alias end-process-grep="ps aux | grep "
# not work
alias psn="aws-vault exec personal --"
alias psn-tf="aws-vault exec personal -- terraform"
alias psn-ns-tf="aws-vault exec --no-session personal terraform"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# ruby-build
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# extra
# export BUNDLE_GITHUB__COM="<personal_access_token>:x-oauth-basic"

# direnv
eval "$(direnv hook zsh)"



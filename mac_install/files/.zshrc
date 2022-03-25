# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export AD_USER='ctw01535'
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
#export KUBECONFIG=$HOME/kubernetes/configs/kubeconfig
export ZSH_MOTD_CUSTOM=batatas
export REQUESTS_CA_BUNDLE="$HOME/.mac-ca-roots"
ZSH_CUSTOM=$DOTFILES
SPACESHIP_ROOT=$ZSH_CUSTOM/themes/spaceship-prompt
#set the name of your custom zsh theme
#ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"

#set the array of all zsh plugins you want to install
plugins=(git docker battery pip python vagrant zsh-autosuggestions zsh-syntax-highlighting zsh-completions copydir tmux)

source $ZSH/oh-my-zsh.sh

#create some alias
alias ll='ls -al'
alias k='kubectl'
alias debugvm_euint='ssh bmw@btceuint-debug.westeurope.cloudapp.azure.com'
alias debugvm_eudev='ssh bmw@btceudev-debug.westeurope.cloudapp.azure.com'
alias debugvm_eudly='ssh bmw@btceudly-debug.westeurope.cloudapp.azure.com'
alias debugvm_nadly='ssh bmw@btcnadly-debug.centralus.cloudapp.azure.com'
alias ssh_github='ssh azureuser@51.124.107.250'
alias fly_login='fly -t genesis login -n mesh-framework -k -c https://btcgenesis.westeurope.cloudapp.azure.com'
alias jmeter='open /usr/local/bin/jmeter'

#place any "secret" environment variables in localrc so they don't get accidentally committed
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source /usr/local/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
autoload -U compinit && compinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
source <(kubectl completion zsh)
neofetch
# Uncomment following code to enable TMUX
#if [ -z "$TMUX" ]
#then
#    tmux new-session -s ctw01537-admin -d
#    tmux attach -t TMUX || tmux new -s TMUX
#fi
command -v flux >/dev/null && . <(flux completion zsh)

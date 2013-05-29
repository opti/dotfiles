ZSH=$HOME/.oh-my-zsh
ZSH_THEME="opti"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git bundler brew gem rbates)

export PATH="\
~/bin:\
~/.bin:\
/usr/local/homebrew/bin:\
/opt/local/bin:\
/opt/local/sbin:\
/usr/local/bin:\
/usr/local/sbin:\
/bin:\
/sbin:\
/usr/bin:\
/usr/sbin:\
/usr/local/git/bin:\
/usr/local/mysql/bin:\
/opt/local/lib/postgresql84/bin:$PATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export PGDATA="/usr/local/var/postgres"

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

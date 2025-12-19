source ~/.config/op/plugins.sh

set -g fish_greeting

set -Ux fish_user_paths /opt/homebrew/bin
set -Ux EDITOR nvim
set -Ux TMUX_PLUGIN_MANAGER_PATH ~/.config/tmux/plugins/tpm/
set -Ux RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@3)"

if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

function fish
  source ~/.config/fish/config.fish
end

alias be="bundle exec"
echo -ne '\e[5 q'

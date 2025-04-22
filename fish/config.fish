set -g fish_greeting

set -Ux fish_user_paths /opt/homebrew/bin
set -Ux EDITOR nvim
set -Ux TMUX_PLUGIN_MANAGER_PATH ~/.config/tmux/plugins/tpm/
set -Ux RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@3)"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Source secrets file if it exists
if test -e $HOME/.config/fish/secrets.fish
  source $HOME/.config/fish/secrets.fish
end

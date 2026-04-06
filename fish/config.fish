source ~/.config/op/plugins.sh

set -g fish_greeting
set -U tide_left_prompt_items pwd git newline

fish_add_path -g /opt/homebrew/bin
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

# Reset cursor to blinking bar on every prompt (fixes nvim restoring block cursor on exit)
function reset_cursor --on-event fish_prompt
    printf '\e[5 q'
end

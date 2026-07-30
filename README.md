# Dotfiles

Configuration files for neovim, tmux, fish and wezterm

## Install

1. Install homebrew
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2. Install preffered apps, shells, envs
    ```
    brew install mise fish fisher tmux neovim wezterm tmuxpack/tpack/tpack
    ```

## Configure

Clone this repo:
```
git clone git@github.com:opti/dotfiles.git ~/.config
```

### Fish edition
1. Install fish
    ```
    brew install fish
    ```

2. Install [fisher](https://github.com/jorgebucaran/fisher) for plugin management
    ```
    brew install fisher
    ```
    or
    ```
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    ```

3. Install & configure [tide](https://github.com/IlanCosman/tide) theme and other plugins
    ```
    fisher install ilancosman/tide@v6
    fisher install patrickf1/fzf.fish
    fisher install jorgebucaran/autopair.fish
    fisher install catppuccin/fish
    ```

### Tmux configuration

1. Install plugin manager
    ```
    brew install tmuxpack/tpack/tpack
    ```

2. Install configured plugins
    ```
    prefix + I
    ```

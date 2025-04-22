# Dotfiles

Configuration files for neovim, tmux, zsh, fish and wezterm

## Install

1. Install homebrew
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2. Install preffered apps, shells, envs
    ```
    brew install mise fish tmux neovim wezterm
    ```

## Configure

Clone this repo:
```
    git clone git@github.com:opti/dotfiles.git ~/.config
    ```

### Zsh edition
1. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

2. Add [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
    ```
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

3. Source zsh configuration
    ```
    echo 'source ~/.config/zsh/zshrc' >> ~/.zshrc
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
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    ```

2. Install catppuccin theme (manual install recommended) due to TMP naming conflicts
    ```
    mkdir -p ~/.config/tmux/plugins/catppuccin
    git clone -b latest https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

    ```

3. Install configured plugins
    ```
    prefix + I
    ```

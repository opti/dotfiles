# Dotfiles

Configuration files for neovim, tmux, zsh.

## Install

1. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

2. Add [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
    ```
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

3. Clone this repo

    ```
    git clone git@github.com:opti/dotfiles.git ~/.config
    ```

4. Source zsh configuration
    ```
    echo 'source ~/.config/zsh/zshrc' >> ~/.zshrc
    ```

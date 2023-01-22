

# Excalith Dotfiles

## Features

**Shell**
- Installs `fish` and `zsh`
- Uses `starship` for shell prompt (supported configs for `bash`, `fish` and `zsh`)
- Includes `tmux` configuration
- Replaces default terminal with `Alacritty` and `kitty`

**Package Manager**

| MacOS        | Ubuntu     |
| ------------ | ---------- |
| homebrew     | apt (nala) |
| homebrew MAS | flatpak    |

**Window Manager**

| MacOS | Ubuntu |
| ----- | ------ |
| yabai | gnome  |

**Packages**

You can check setup scripts for [MacOS](system/macos/setup_packages.sh) and [Ubuntu](system/ubuntu/setup_packages.sh) for packages.



## Installation
These dotfiles are intended for `MacOS 12.0 and above` and `Ubuntu 22.04 and above`

Depending on your OS, copy and paste the code to start installation. This code will download my dotfiles and start setup depending on your OS.

### MacOS
Supports _**MacOS 12.0 Monterey**_ and above
```bash
bash -c "$(curl -LsS https://raw.github.com/excalith/.dotfiles-new/main/scripts/setup.sh)"
```

### Ubuntu
Supports _**Ubuntu 22.04 Jammy Jellyfish**_ and above
```bash
bash -c "$(wget --no-cache -qO - https://raw.github.com/excalith/.dotfiles-new/main/scripts/setup.sh)"
```



## TO-DO

### Ubuntu
- A wayland-compatible WM to act like yabai



## Credits
This dotfiles repository is a heavily ~~knocked-off~~ inspired version of beautiful [Cătălin’s dotfiles](https://github.com/alrra/dotfiles). You should probably check it out!

I have modified this dotfiles with my own taste of config files and added a bunch of helpers and utilities to install packages, extensions etc. from different sources that I trust. I tried to seperate installation system and OS-spesific configurations as much as I can, so it would be easier to implement new OS setups which I might do later.

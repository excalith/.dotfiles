<p align="center">
	<h1 align="center">Excalith Dotfiles</h1>
</p>

![Screenshot of alacritty terminal using fish shell with spaceship prompt and tmux, displaying neofetch, nvim and custom scripts](assets/screenshots/dotfiles.png)

## Features

- Fully customizable installation depending on OS
- The [installer](scripts/) is seperated from configs and install scripts
- A [dotfiles manager](bin/dotfiles/main.sh) for post-install maintenance
- Has post-install scripts for configuring `git`, `ssh` and `gpg`
- Requires git commands for syncing without fancy dotfile managers

## Uses

- Supports `bash`, `zsh` and `fish` with `starship` shell prompt and has `tmux` support
- Replaces default terminal with `Alacritty`

## Installation

Depending on your OS, copy and paste the code to start installation. This code will download my dotfiles and start setup depending on your OS.

> If you have no idea what this repository is all about, please do not simply run these commands. They will override your configurations with my configurations and install bunch of packages.

### MacOS 12.0 Monterey (and above)

```bash
bash -c "$(curl -LsS https://raw.github.com/excalith/.dotfiles/main/scripts/setup.sh)"
```

### Ubuntu 22.04 Jammy Jellyfish (and above)

```bash
bash -c "$(wget --no-cache -qO - https://raw.github.com/excalith/.dotfiles/main/scripts/setup.sh)"
```

### Arch Linux

```bash
bash -c "$(wget --no-cache -qO - https://raw.github.com/excalith/.dotfiles/main/scripts/setup.sh)"
```


### Windows (10 and above)
Allow remote scripts to run
```
Set-ExecutionPolicy RemoteSigned -Force
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
Set-ExecutionPolicy Bypass -Scope Process
```

Download the dotfiles and start setup
```
Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/excalith/.dotfiles/main/scripts/setup.ps1').Content
```

Reset Execution Policy
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Restricted
```

## Using Dotfiles

After installing the dotfiles, you can pretty much start using these configurations right away.

- All changes to configuration files will be recognized by git as modified within dotfiles folder except for the config files created with `.local` suffix.
- You can use `dotfiles` command for dotfile manager script for running maintenance commands.

## Making Your Own Dotfiles

If you want to create your own dotfiles based on my configuration, you should

1. Fork or download this repository
2. Update [setup](scripts/setup.sh) script with your repository settings (do not change the preset `.dotfiles` path)
3. Change the configurations and packages as you wish
4. Push your changes to **your own** repository
5. Run setup bash commands

## Credits

This dotfiles repository is a heavily ~~knocked-off~~ inspired version of beautiful [Cătălin’s dotfiles](https://github.com/alrra/dotfiles). You should probably check it out!

I have modified this dotfiles with my own taste of config files and added a bunch of helpers and utilities to install packages, extensions etc. from different sources that I trust. I tried to seperate installation system and OS-spesific configurations as much as I can, so it would be easier to implement new OS setups which I might do later.

## License

The code is available under the [MIT license](LICENSE).

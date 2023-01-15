> ⚠️ This repository is work-in-progress!

# Excalith Dotfiles
Intended for `MacOS 12.0` and `Ubuntu 22.04`

## Installation
This code will download dotfiles and start installing process depending on your OS
```bash
bash -c "$(wget --no-cache -qO - https://raw.githubusercontent.com/excalith/.dotfiles-new/main/scripts/setup.sh)"
```


## TO-DO:
- **Check MacOS setup on VM:** This is a re-implementation of my MacOS dotfiles. Never tested with this setup yet.

- **Add 1Password CLI integration:** A CLI integration would be great for syncinc secrets such as ssh and gitconfig https://developer.1password.com/docs/cli/get-started/#install

- **Install 1Password from source:** Sandboxing prevents 1Password CLI integration. Installing from source should fix this
https://support.1password.com/install-linux/

- **When everything works as intended:** Add a beautiful README to become a show-off


## Credits
This dotfiles setup process is heavily inspired / knocked-off version of [Cătălin’s dotfiles](https://github.com/alrra/dotfiles). You should probably check it out instead if you are to fork this. I have changed the way I install packages and symlink config files.

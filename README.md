# Lorenzo Colombo - Dotfiles

This is my dotfiles repo, which contains my configuration files for the applications I use in my day-to-day workflow. It is tested to work on GNU/Linux systems (mainly on Fedora and Arch) and on MacOs (in this case window managers are not considered). To use it, you can download the repo in your home directory and, using [GNU Stow](https://www.gnu.org/software/stow/) within the `dotfiles/` directory give the command `stow .`, which generates symbolic links to the file configuration files and directories.

## Dependencies

For the configuration is generally required a patched font. I personally use the IntoneMono Nerd Font, which can be downloaded [here](https://www.nerdfonts.com/). **XMonad** and **Hyprland** are configured to used some applications by default, like [feh](https://wiki.archlinux.org/title/feh) to set the wallpaper[^1] and [Thuar](https://docs.xfce.org/xfce/thunar/start) as a GUI file manager.

Other dependencies/programs I use in the configs might be:

- [Pamixer](https://github.com/cdemoulins/pamixer), to manage audio controls;
- [Brightnessctl](https://github.com/Hummer12007/brightnessctl), to control screen bightnes;
- [feh](https://wiki.archlinux.org/title/feh) and [swaybg](https://github.com/swaywm/swaybg), to set the wallpapers;
- [Wofi](https://hg.sr.ht/~scoopta/wofi) and [dmenu](https://tools.suckless.org/dmenu/) as application finders and more.


# Software configurations in the repo

## Window managers and Wayland compositors
Other than that, it contains also the configuration for the [XMonad window manager](https://xmonad.org/) and XMobar, the most commonly used with Xmonad, as well as my configuration for the [Hyprland compositor](https://hyprland.org/) and [Waybar](https://github.com/Alexays/Waybar).

## Programs

### Alacritty

[Alacritty](https://alacritty.org/) is a very good, cross-platform terminal emulator written in the Rust programming language. It is configured in the `alacritty.toml` file. In most situations, changes to the configuration file are applied as soon as the modified file is saved.

The `alacritty/` directory also contains a theme, in the `hyper.toml` file, which was downloaded from the official [alacritty themes repo](https://github.com/alacritty/alacritty-theme/tree/master), where you can also find other themes.

### Neovim

My neovim config is based on the [Lazy package manager](https://github.com/folke/lazy.nvim). It is wired to work best with the programming language I mostly use and it is in some way inspired by [this](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim) configuration.

### Vim

I don't use vim that much, preferring Neovim for any real work, therefore my `.vimrc` is really minimal.

### Gnu Emacs

My configuration for Gnu Emacs is done via the `configuration.org` file, which is quite descriptive; you might direclty refere to that.

### Tmux

I think [Tmux](https://github.com/tmux/tmux/wiki) works great out of the box, so I don't use any external plugins and my configuration file is really bare-bones.



====
[^1]: Note that the path to the wallpaper is hard-coded in the configuration files; you would have to set your own for it to work.

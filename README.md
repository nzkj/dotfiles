# dotfiles

This repository contains my configuration for various tools. In the following sections, I'll explain some aspects of my developer workflow.

## Dependencies

Here's a summary of the dependencies for my config:
1. [TMUX](https://github.com/tmux/tmux?tab=readme-ov-file#installation)
2. [Neovim](https://github.com/neovim/neovim) via [Bob](https://github.com/MordechaiHadad/bob?tab=readme-ov-file#-installation)
3. [Ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
4. [Xclip](https://github.com/astrand/xclip)
5. [Zoxide](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation)
6. [Fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#installation)
7. [Bat](https://github.com/sharkdp/bat?tab=readme-ov-file#installation)
8. [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)


## Terminal

- Windows: [Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=en-nz&gl=NZ)
- Mac: [Alacritty](https://github.com/alacritty/alacritty)
- Linux: [Gnome Terminal](https://help.gnome.org/users/gnome-terminal/stable/)

My current nerd font of choice is [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack).

### TMUX

[TMUX](https://github.com/tmux/tmux/wiki) is how I manage my projects and terminals; it is essential to my workflow.

My structure revolves around:

- **Sessions**: One for each repository/project.
- **Windows**: First window for Neovim, the rest are for any normal terminal stuff.
- **Panes**: Not used all that much, as I typically create another window.

Terminal multiplexing is amazing and having persistent sessions is crucial for me. Once I've created a TMUX session, I can attach to it from my laptop (or any other machine) through ssh, which is really convenient when working remotely. Paired with Neovim, it makes working in the terminal seamless.

### Zoxide

Zoxide is a smarter `cd` command that makes navigating around frequently used directories much easier. Read more [here](https://github.com/ajeetdsouza/zoxide).

### fzf

Fzf is a command line fuzzy finder. In particular, I like it for the revere command search (using `Ctrl-r`) and checking out git branches (see `gbc` in `.bashrc`). Read more [here](https://github.com/junegunn/fzf).


## Neovim

My text-editor/IDE of choice is [Neovim](https://neovim.io/). Neovim, unlike any other editor, allows me to achieve the "flow state"; paired with TMUX, it reduces the mental overhead of actioning my thoughts. I have highlighted some specific plugins/configurations that have made a world of difference.

#### Telescope

I use Telescope extensively; it is the one of most important plugins in my Neovim configuration. Telescope allows me to fuzzy find over files, folders, open buffers/files, text via grep, symbols and so much more.

Learn more at [Telescope](https://github.com/nvim-telescope/telescope.nvim).

#### Harpoon

Often when I am editing text, I'm mainly focused on up to four "core" files. I use Harpoon to attach these four files to the keymaps below:

1. `Ctrl-t` for file 1.
2. `Ctrl-s` for file 2.
3. `Ctrl-r` for file 3.
4. `Ctrl-a` for file 4.

<sup>Note: "arst" are the left homerow keys for Colemak-Dhm.</sup>

This allows me to seamlessly switch between files of interest wicked fast. Harpoon has the added benefit of remembering your previous cursor position in the file, and persists through opening/closing Neovim. I navigate to other files from these "core" files via Neovim's LSP (e.g go-to-definition, go-to-reference) and Telescope's fuzzy searching.

Learn more at [Harpoon](https://github.com/ThePrimeagen/harpoon).

#### Marks

In a similar vein to the previous section, I'm often focused on up to four "core" locations _within_ a file. I use Neovim marks to attach these locations to the keymaps below:

1. `Alt-t` for mark `t`.
2. `Alt-s` for mark `s`.
3. `Alt-r` for mark `r`.
4. `Alt-a` for mark `a`.

I can mark a location in a file by pressing `m` followed by the desired letter (e.g. `mt`). Then, with the keymaps above, I can switch between locations of interest wicked fast. Each mark is unique to the file; in other words, each file can have its own set of `arst` marks.

See `nvim/lua/options.lua` for the keymaps.

#### Flash

I never really fell in love with Vim's `f F t T ; ,` motions, and `/` could only achieve so much. What I really want, is too look at a bit of text on the screen and navigate there in as few strokes as possible - Flash lets me to do this.

Learn more at [Flash](https://github.com/folke/flash.nvim).

#### Oil

This plugin is simple in concept - it allows editing of directories as a Vim buffer. This lets me create files and directories by writing text whilst taking advantage of Vim's powerful motions.

Learn more at [Oil](https://github.com/stevearc/oil.nvim).


## Keyboard

For my layout, I use a combination of Qwerty (on a regular keyboard, such as the built-in laptop keyboard) and [Colemak DH-m](https://colemakmods.github.io/mod-dh/) (on my split keyboard). My split keyboard of choice is the [ZSA Voyager](https://www.zsa.io/voyager), which has 52 keys (with two keys per thumb cluster).

The split keyboard is programmable, which allows me to create macros (e.g for switching TMUX windows and sessions, or between applications), layers for numbers/symbols/navigation, and more.

My layout has been optimised for me; things are made as accessible and ergonomic as possible. I've configured the layout via ZSA's Oryx tool, but the raw layout files are included in this repo too. You can access my layout in the Oryx configurator [here](https://configure.zsa.io/voyager/layouts/LNErX/ynb9d/0/intro).


## Other

At this point, I think a standing desk and noise cancelling headphones might as well be a part of my dotfiles.

I hope you found the write-up above somewhat interesting, thanks for having a look!

# dotfiles

This repository contains my configuration for various tools. In the following sections, I explain some of the design choices related to my developer workflow.


## Terminal

I typically daily drive a Windows machine that's ssh'd into a Linux machine, or use Windows Subsystem for Linux (WSL). For this reason, I'm normally using [Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=en-nz&gl=NZ) as my emulator. When I'm working on a Mac, I use [Alacritty](https://github.com/alacritty/alacritty).

My current nerd font of choice is [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack).


## TMUX

[TMUX](https://github.com/tmux/tmux/wiki) is how I manage my projects and terminals; it is essential to my workflow.

My structure revolves around:

- **Sessions**: One for each repository/project.
- **Windows**: First window for Neovim, the rest are for any normal terminal stuff.
- **Panes**: Not used all that much, as I typically create another window.

While terminal multiplexing is amazing, having persistent sessions is crucial for me. Once I've created a TMUX session, I can attach to it from my laptop (or any other machine) through ssh, or my Linux machine, and pick up where I left off. Paired with Neovim, it makes working in the terminal seamless.


## Neovim

My text-editor/IDE of choice is [Neovim](https://neovim.io/). Neovim, unlike any other editor, allows me to reach the coveted "flow state" in developing; paired with TMUX, it reduces the mental overhead of actioning my thoughts. I have highlighted some specific plugins that have made a world of difference.

#### Telescope

I use Telescope extensively; it is the single most important plugin in my Neovim configuration (other than the LSP). Telescope allows me to fuzzy find over files, folders, open buffers (removing the need for showing file tabs), occurrences of text via grep, symbols and so much more.

Learn more at [Telescope](https://github.com/nvim-telescope/telescope.nvim).

#### Harpoon 

Often when I am editing text, I am mainly focused on up to four "core" files. I use Harpoon to attach these four files to the keymaps below:

1. `C-t` for file 1.
2. `C-s` for file 2.
3. `C-r` for file 3.
4. `C-a` for file 4.

<sup>Note: "arst" are the left homerow keys for Colemak-Dhm. C means Ctrl.</sup>

This allows me to seamlessly switch between files of interest wicked fast. Harpoon has the added benefit of remembering your previous cursor position in the file, and persists through opening/closing Neovim. I navigate to other files from these "core" files via Neovim's LSP (e.g go-to-definition, go-to-reference) and Telescope's fuzzy searching.

Learn more at [Harpoon](https://github.com/ThePrimeagen/harpoon).

#### Flash

I never really fell in love with Vim's `f F t T ; ,` motions, and `/` could only achieve so much. What I really want, is too look at a bit of text on the screen and navigate there in as few strokes as possible - Flash lets me to do this.

Learn more at [Flash](https://github.com/folke/flash.nvim).

#### Oil

This plugin is simple in concept - it allows editing of directories as a Vim buffer. This lets me create files and directories by writing text whilst taking advantage of Vim's powerful motions.

Learn more at [Oil](https://github.com/stevearc/oil.nvim).


## Web Browsing

Once you become so used to Vim motions, you begin to want to use them everywhere. A great extension is Vimium, which adds Vim motions to the web browser.

For instance, you can navigate up and down pages with keys like `h j k l` for small movements, `d u` for half page scrolling etc. You can also use `f` to show a key on all links, whereby pressing the shown key clicks the link. No more mouse!

Learn more at [Vimium](https://github.com/philc/vimium).


## Keyboard

For my layout, I use a combination of Qwerty (on a regular keyboard, such as the built-in laptop keyboard) and [Colemak DH-m](https://colemakmods.github.io/mod-dh/) (on my split keyboard). My split keyboard of choice is the [ZSA Voyager](https://www.zsa.io/voyager), which has 52 keys (with two keys per thumb cluster).

The split keyboard is programmable, which allows me to create macros (e.g for switching TMUX windows and sessions, or between applications), layers for numbers/symbols/navigation, and more.

My layout has been optimised for me; things are made as accessible and ergonomic as possible. I've configured the layout via ZSA's Oryx tool, but the raw layout files are included in this repo too. A preview of my layout in Oryx is shown below:


<details>
  <summary>Base Layer</summary>
  <img src="https://gist.githubusercontent.com/nzkj/de74dc4e5c7498657477e3759ad1d185/raw/cc4c4448a93df24cadb5d2470ed484b827715703/BaseLayer.png">
</details>

<details>
  <summary>Symbols Layer</summary>
  <img src="https://gist.githubusercontent.com/nzkj/de74dc4e5c7498657477e3759ad1d185/raw/cc4c4448a93df24cadb5d2470ed484b827715703/SymbolsLayer.png">
</details>

<details>
  <summary>Navigation Layer</summary>
  <img src="https://gist.githubusercontent.com/nzkj/de74dc4e5c7498657477e3759ad1d185/raw/cc4c4448a93df24cadb5d2470ed484b827715703/NavigationLayer.png">
</details>

<details>
  <summary>Numbers Layer</summary>
  <img src="https://gist.githubusercontent.com/nzkj/de74dc4e5c7498657477e3759ad1d185/raw/cc4c4448a93df24cadb5d2470ed484b827715703/NumbersLayer.png">
</details>

## Other

At this point, I think a standing desk and noise cancelling headphones might as well be a part of my dotfiles.

I hope you found the write-up above somewhat interesting, thanks for having a look!

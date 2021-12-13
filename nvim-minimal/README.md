# A minimal configuration for full blown IDE capabilities with neovim

## Plugins manager
I tried using [Packer](https://github.com/wbthomason/packer.nvim) but I encountered some weird bugs and ended up going back to [Plug](https://github.com/junegunn/vim-plug).
My approach to which plugins to choose focused a lot on them being made in lua or not. One of my main objectives with this minimal config was come closer to the new ecosystem that we can see thriving with NeoVim.

### Completion and LSP capabilities
For this part I used the native LSP that neovim supports nowadays. It works really well, my stress was mostly with setting up snippet support that doesn't come integrated.

For snippet support I was trying with [LuaSnip](https://github.com/L3MON4D3/LuaSnip) but it was failing in ways that I didn't manage to understand. Swapping to [vsnip](https://github.com/hrsh7th/vim-vsnip) was nice and just worked. It makes sence since it's from the author of the [completion plugin used](https://github.com/hrsh7th/nvim-cmp).

### Fuzzy file finding + live grep capabilities
For this purpose my choice was simply [Telescope](https://github.com/nvim-telescope/telescope.nvim). It works incredibly well but it does not automatically configure live-grep.
There's some extra executables that need to be installed at the OS level.

The command ``:checkhealth telescope`` helps a lot in ensuring that you don't miss anything.

### Themes and status bar
For theme management all one needs to do is install the packages of the desired themes.
Right now I'm fiddling with [Tender](https://github.com/jacoborus/tender.vim).
For status bar, I'm using [LuaLine](https://github.com/nvim-lualine/lualine.nvim) although there's many other options like [LightLine](https://github.com/itchyny/lightline.vim) and [AirLine](https://github.com/vim-airline/vim-airline).

### Extras
  * [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
  * [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
  * [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

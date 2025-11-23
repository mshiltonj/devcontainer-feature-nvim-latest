# Devcontainer Feature - Neovim

## nvim-latest
* adds the lastest (nightly!) neovim to /opts/nvim/
* adds /opts/nvim/bin to the path

### plugins
With the plugins option, you can pre-install a number of neovim plugin.
You must define a containerUser in your .devcontainer.json for the plugins to install.
The plugins options value is a whitespace delimited list of plugin urls. Like so:

    {
      "name" : "MyDevContainer",
      "dockerComposeFile": "../docker-compose.yml",
      "service": "app",
      "containerUser": "ubuntu",
      "features": {
        "./nvim-latest": {
          "plugins": "
            https://github.com/tpope/vim-fugitive
            https://github.com/nvim-telescope/telescope.nvim
            https://github.com/nvim-treesitter/nvim-treesitter
            https://github.com/nvim-tree/nvim-web-devicons
            https://github.com/nvim-lua/plenary.nvim
            https://github.com/nvim-telescope/telescope.nvim
            https://github.com/neovim/nvim-lspconfig
            https://github.com/mason-org/mason.nvim
            https://github.com/mason-org/mason-lspconfig.nvim
            https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
            https://github.com/dgagn/diagflow.nvim",
          "./tmux": {}
      }
    }

## testing
tested with:

     devcontainer features test --base-image fedora:latest
     devcontainer features test --base-image fedora:latest
     devcontainer features test --base-image arch:latest


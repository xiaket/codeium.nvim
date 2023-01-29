# codeium.nvim

Native [Codeium](https://www.codeium.com/) plugin for Neovim

## Contributing

Feel free to create an issue/PR if you want to see anything else implemented.

## Screenshots

## Installation

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "jcdickinson/codeium.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("codeium").setup({
        })
    end
}
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "jcdickinson/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("codeium").setup({
        })
    end
}

```

## Usage

After installation and configuration, you will need to authenticate with
Codeium. This can be done by running `:Codeium Auth`, copying the token from
your browser and pasting it into API token request.

## Options

- `api`: information about the API server to use:
  - `host`: the hostname
  - `port`: the port
- `tools`: paths to binaries used by the plugin:
  - `uname`
  - `uuidgen`
  - `curl`
  - `gzip`
- `wrapper`: the path to a wrapper script/binary that is used to execute any
  binaries not listed under `tools`. This is primarily useful for NixOS, where
  a FHS wrapper can be used for the downloaded codeium server.

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

After calling `setup`, this plugin will register a source in nvim-cmp. nvim-cmp
can then be set up to use this source using the `sources` configuration:

```lua
cmp.setup({
    -- ...
    sources = {
        -- ...
        { name = "codeium" }
    }
})
```

# Neovim Config

Minimal config for Neovim >= 0.12.

## New environment

```sh
brew install neovim tree-sitter lua-language-server ruff stylua fd ripgrep
npm install -g pyright typescript-language-server typescript prettier
git clone git@github.com:siansiansu/nvim.git ~/.config/nvim
```

`tree-sitter` and a C compiler (`xcode-select --install`) build the parsers.
Diagnostics come from language servers only, so `ruff` runs as one
(`ruff server`) alongside `pyright`; `stylua` and `prettier` are the only
tools conform shells out to. `:find` lists files with `fd`, `:grep` runs `rg`.

First launch installs the plugins pinned in `nvim-pack-lock.json` and compiles
the parsers. Then `:restart`, and `:checkhealth`.

## Updating plugins

```vim
:lua vim.pack.update()
```

`:write` to accept, `:quit` to discard, then `:restart`. Parsers rebuild
themselves through the `PackChanged` hook in `init.lua`.

To roll back, restore `nvim-pack-lock.json` from git, then:

```vim
:restart
:lua vim.pack.update(nil, { offline = true, target = "lockfile" })
```

Neovim and the Homebrew tools update with `brew upgrade`; the npm ones
with `npm update -g`.

## Adding or removing a plugin

Add a spec to `vim.pack.add()` in `init.lua`, then `:restart`. To remove one,
delete its spec, `:restart`, then:

```vim
:lua vim.pack.del({ "plugin-name" })
```

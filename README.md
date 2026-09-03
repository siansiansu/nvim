# Neovim Config

Minimal config for Neovim >= 0.12.

## New environment

```sh
brew install neovim tree-sitter ripgrep fd \
  lua-language-server pyright ruff stylua prettier \
  typescript-language-server eslint_d
git clone git@github.com:siansiansu/nvim.git ~/.config/nvim
```

`tree-sitter` and a C compiler build the parsers; `ripgrep` and `fd` back the
snacks picker.

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

Neovim and the external tooling update with `brew upgrade`.

## Adding or removing a plugin

Add a spec to `vim.pack.add()` in `init.lua`, then `:restart`. To remove one,
delete its spec, `:restart`, then:

```vim
:lua vim.pack.del({ "plugin-name" })
```

# Neovim Config

Minimal config for Neovim >= 0.12.

## New environment

```sh
brew install neovim tree-sitter ripgrep fd \
  lua-language-server pyright ruff stylua prettier \
  typescript-language-server eslint_d
git clone git@github.com:siansiansu/nvim.git ~/.config/nvim
```

`tree-sitter` plus a C compiler (Xcode Command Line Tools on macOS) build the
treesitter parsers; `ripgrep` and `fd` back the snacks picker. Language servers,
formatters and linters come from Homebrew rather than mason.

First launch installs every plugin listed in `nvim-pack-lock.json` at its pinned
revision, then compiles the parsers in the background. Once it settles, `:restart`
to load the installed code, and `:checkhealth` to confirm the toolchain is found.

## Updating plugins

```vim
:lua vim.pack.update()
```

That fetches every plugin and opens a confirmation tabpage — `:write` to accept,
`:quit` to discard. Then `:restart` to run the new code, and commit the lockfile:

```sh
git commit -m "update plugins" nvim-pack-lock.json
```

Treesitter parsers are rebuilt automatically: the `PackChanged` hook in
`init.lua` calls `require("nvim-treesitter").update()` after the plugin updates,
which also relinks `queries/` if the parsers went stale.

To undo an update, restore the lockfile and roll the plugins back to it:

```sh
git checkout HEAD -- nvim-pack-lock.json
```

```vim
:restart
:lua vim.pack.update(nil, { offline = true, target = "lockfile" })
```

Update Neovim itself and the external tooling with `brew upgrade`.

## Adding or removing a plugin

Add a spec to `vim.pack.add()` in `init.lua`, then `:restart` — it is installed
on the next startup. To remove one, delete its spec, `:restart`, then drop it
from disk:

```vim
:lua vim.pack.del({ "plugin-name" })
```

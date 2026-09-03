# Neovim Config

Minimal config for Neovim >= 0.12.

## Setup

Plugins install themselves on first launch. Language servers, formatters and
linters come from Homebrew rather than mason:

```sh
brew install lua-language-server pyright ruff stylua prettier \
  typescript-language-server eslint_d
```


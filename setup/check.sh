#!/bin/bash
# Checks whether the things from session 2 are installed and set up.
#
# Run it from the top folder of the usergroup repo:
#
#     bash setup/check.sh
#
# Each line shows a tick or a cross. A cross is not an error. It tells you
# which step of sessions/02-shell-setup.md is still to do.

if [ ! -f setup/check.sh ]; then
  echo "Run this from the top folder of the repo:"
  echo "    cd ~/Projects/Craik-Computational-Usergroup"
  echo "    bash setup/check.sh"
  exit 1
fi

MISSING=0
ok()   { printf '  \033[32m✓\033[0m %s\n' "$1"; }
miss() { printf '  \033[31m✗\033[0m %s\n' "$1"; MISSING=$((MISSING + 1)); }
have() { command -v "$1" >/dev/null 2>&1; }

echo
echo "Homebrew"
if have brew; then
  ok "brew $(brew --version | head -n 1 | awk '{print $2}') at $(command -v brew)"
else
  miss "brew is not found (session 2, step 2)"
fi

echo
echo "git and GitHub"
if have git; then ok "git $(git --version | awk '{print $3}') at $(command -v git)"; else miss "git"; fi
if [ -n "$(git config --global user.name 2>/dev/null)" ] && [ -n "$(git config --global user.email 2>/dev/null)" ]; then
  ok "git knows your name and email"
else
  miss "git user.name and user.email are not set (session 1, setup step 5)"
fi
if have gh; then
  if gh auth status >/dev/null 2>&1; then ok "gh is logged in"; else miss "gh is installed but not logged in: gh auth login"; fi
else
  miss "gh (session 1, setup step 3)"
fi

echo
echo "shell"
if [ -d "$HOME/.oh-my-zsh" ]; then ok "Oh My Zsh"; else miss "Oh My Zsh (session 2, step 3)"; fi
if grep -q "oh-my-zsh.sh" "$HOME/.zshrc" 2>/dev/null; then
  ok "~/.zshrc loads Oh My Zsh"
else
  miss "~/.zshrc does not load Oh My Zsh (cp setup/zshrc.example ~/.zshrc)"
fi
if have brew; then
  p="$(brew --prefix)"
  if [ -f "$p/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then ok "zsh-autosuggestions"; else miss "zsh-autosuggestions"; fi
  if [ -f "$p/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then ok "zsh-syntax-highlighting"; else miss "zsh-syntax-highlighting"; fi
fi

echo
echo "command-line tools"
for tool in fzf eza bat fd rg tree tldr htop wget jq; do
  if have "$tool"; then ok "$tool"; else miss "$tool (brew bundle --file=setup/Brewfile)"; fi
done

echo
echo "python"
if have uv; then
  ok "uv $(uv --version | awk '{print $2}')"
  n="$(uv python list --only-installed 2>/dev/null | awk '{print $1}' | sort -u | wc -l | tr -d ' ')"
  if [ "${n:-0}" -gt 0 ]; then ok "uv has $n Python version(s) installed"; else miss "no Python installed by uv yet: uv python install 3.13"; fi
else
  miss "uv (brew bundle --file=setup/Brewfile)"
fi

echo
echo "this repo"
if [ -f corehpc/README.md ]; then ok "corehpc submodule is filled in"; else miss "corehpc/ is empty: git submodule update --init"; fi

echo
if [ "$MISSING" -eq 0 ]; then
  echo "All set."
else
  echo "$MISSING thing(s) still to do. The steps are in sessions/02-shell-setup.md"
fi
echo

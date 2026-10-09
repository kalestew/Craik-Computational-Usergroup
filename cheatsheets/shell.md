# Shell cheatsheet

The terminal runs **zsh**, a shell: a program that reads a command, runs it, and shows the result. Everything here works in Terminal on a Mac. Type only the command, not the `%` or `➜` prompt.

[Session 1](../sessions/01-git-basics.md#command-line-basics) explains the first few commands with more words. [Session 2](../sessions/02-shell-setup.md) installs the tools in the last table.

- [Moving around](#moving-around)
- [Files and folders](#files-and-folders)
- [Reading files](#reading-files)
- [Finding things](#finding-things)
- [Joining commands](#joining-commands)
- [Running things](#running-things)
- [Keyboard shortcuts](#keyboard-shortcuts)
- [Your shell's files](#your-shells-files)
- [The nicer tools](#the-nicer-tools)

## Moving around

| Command | What it does |
| --- | --- |
| `pwd` | Print which folder you are in. |
| `ls` | List the files here. `ls -la` adds hidden files and details. |
| `cd Projects` | Move into `Projects`. |
| `cd ..` | Up one folder. `cd ../..` goes up two. |
| `cd ~` or just `cd` | Your home folder. `~` means home anywhere in a command. |
| `cd -` | Back to the folder you were in before. |
| `open .` | Open the current folder in Finder. |

## Files and folders

| Command | What it does |
| --- | --- |
| `mkdir results` | Make a folder. `mkdir -p a/b/c` makes the whole chain. |
| `touch notes.md` | Make an empty file. |
| `cp a.csv b.csv` | Copy. `cp -r folder copy` copies a folder. |
| `mv old.csv new.csv` | Rename, or move if the target is a folder. |
| `rm file` | Delete a file. No trash, no undo. `rm -r folder` deletes a folder. |
| `nano file` | Edit. `Ctrl+O` then Enter saves, `Ctrl+X` exits. |
| `open file.png` | Open with the normal Mac app. |

## Reading files

| Command | What it does |
| --- | --- |
| `cat file` | Print the whole file. |
| `bat file` | The same, with colours and line numbers. |
| `head file` | The first 10 lines. `head -n 3 file` for 3. |
| `tail file` | The last 10 lines. `tail -n +2 file` prints everything except the first line. |
| `less file` | Page through a big file. Space for the next page, `q` to quit. |
| `wc -l file` | Count lines. `wc -w` counts words. |

## Finding things

| Command | What it does |
| --- | --- |
| `grep word file` | Lines containing `word`. |
| `grep -c word file` | Count them instead. `-i` ignores case, `-v` keeps lines *without* the word, `-n` adds line numbers, `-w` matches whole words only. |
| `grep -r word .` | Search every file under here. |
| `rg word` | The same job, faster, coloured, skips `.git`. |
| `find . -name "*.csv"` | Find files by name. |
| `fd csv` | The same job, simpler. |
| `which git` | Which file runs when you type `git`. |
| `man ls` | The manual. `q` to leave. |
| `tldr ls` | Short examples instead. |

## Joining commands

| Syntax | What it does |
| --- | --- |
| `a \| b` | Pipe: the output of `a` becomes the input of `b`. |
| `a > file` | Save the output in `file`, replacing it. |
| `a >> file` | Add the output to the end of `file`. |
| `a && b` | Run `b` only if `a` worked. |
| `a; b` | Run `a`, then `b`. |
| `sort` | Sort lines. `-n` as numbers, `-r` reversed, `-u` one of each. `-t, -k5` by the 5th comma-separated column. |
| `uniq -c` | Collapse repeated neighbouring lines and count them. Sort first. |
| `cut -d, -f2` | Column 2 of a CSV. `-f2,5` for two columns. |
| `tr ',' '\t'` | Swap one character for another. |

Wildcards: `*` stands for any text and `?` for one character. `ls *.csv`, `wc -l practice/*.csv`.

## Running things

| Command | What it does |
| --- | --- |
| `Ctrl+C` | Stop whatever is running. |
| `htop` | What is running right now. `q` to leave. |
| `history` | Everything you have typed. |
| `chmod +x script.sh` | Make a script runnable. Then `./script.sh`. |
| `bash script.sh` | Run a script without making it runnable. |
| `echo $PATH` | The folders the shell searches for commands, in order. |
| `export NAME=value` | Set a variable for this terminal window. `echo $NAME` reads it. |
| `alias ll='eza -la'` | A short name for a longer command. Put it in `~/.zshrc` to keep it. |
| `source ~/.zshrc` | Reload your settings after editing them. |

## Keyboard shortcuts

| Keys | What they do |
| --- | --- |
| `Tab` | Finish a file or command name. Press twice to see the options. |
| `↑` `↓` | Earlier commands. |
| `→` | Accept the grey suggestion (session 2). |
| `Ctrl+R` | Search your history. Type a few letters, pick with the arrows, Enter. |
| `Ctrl+A` / `Ctrl+E` | Jump to the start / end of the line. |
| `Ctrl+U` | Clear the line. |
| `Ctrl+L` | Clear the screen. |
| `Ctrl+C` | Cancel. |
| `Ctrl+D` | Close this shell. |
| `Cmd+T` | New Terminal tab. |
| `Cmd+K` | Wipe the scrollback. |

## Your shell's files

Files whose names start with `.` are hidden. `ls -a ~` shows them.

| File | What it is |
| --- | --- |
| `~/.zprofile` | Runs once when a window opens. Homebrew's line lives here. |
| `~/.zshrc` | Runs for every shell. Theme, plugins, aliases. Our starter is `setup/zshrc.example`. |
| `~/.zsh_history` | Everything you have typed. |
| `~/.oh-my-zsh/` | Oh My Zsh itself. |
| `~/.gitconfig` | git's settings: name, email, editor. |
| `~/.ssh/` | SSH keys and the `config` file for the cluster. |

## The nicer tools

Installed in session 2 with `brew bundle --file=setup/Brewfile`.

| Instead of | Try | Why |
| --- | --- | --- |
| `ls -la` | `eza -la` | Colours and git status. `eza --tree` draws a tree. |
| `cat` | `bat` | Colours and line numbers. |
| `find . -name` | `fd` | `fd csv` just works. |
| `grep -r` | `rg` | Fast, coloured, skips `.git`. |
| `man` | `tldr` | Examples instead of pages. |
| `top` | `htop` | Readable. |
| `curl -O` | `wget` | Download a file from a URL. |
| | `jq` | Read JSON: `gh api user \| jq .login` |
| `↑` `↑` `↑` | `Ctrl+R` | Fuzzy search through your history, from fzf. |

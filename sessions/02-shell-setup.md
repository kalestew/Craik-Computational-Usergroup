# Session 2: setting up your Mac for computational work

← [All sessions](../README.md)

Our second session (16 October 2026). Last time most of us met the terminal for the first time, and a lot of it felt bare: no colours, no hints, no way to search what you typed before, and tools that weren't installed. Today we fix that. Everything here is for a Mac, in the **Terminal** app, which runs a shell called **zsh**.

By the end you will have:

- the latest version of this repo, with the CoreHPC guide filled in
- Homebrew, and a dozen command-line tools installed with one command
- a shell that shows the git branch in the prompt, suggests commands from your history, and colours what you type green or red
- Python set up with `uv`, with your first project and your first plot
- the handful of Unix commands for searching, slicing and counting a CSV file

Contents:

- [Before we start: update the repo](#before-we-start-update-the-repo)
- [1. Where you are typing](#1-where-you-are-typing)
- [2. Homebrew and the tools](#2-homebrew-and-the-tools)
- [3. A friendlier shell](#3-a-friendlier-shell)
- [4. A tour of the new tools](#4-a-tour-of-the-new-tools)
- [5. Python with uv](#5-python-with-uv)
- [6. Unix essentials: searching, slicing and counting a CSV](#6-unix-essentials-searching-slicing-and-counting-a-csv)
- [7. Check that it all worked](#7-check-that-it-all-worked)
- [When things go wrong](#when-things-go-wrong)
- [Before next time](#before-next-time)

## Before we start: update the repo

Open Terminal, go to the repo and pull. The repo was reorganised after session 1 and gained a submodule, so there is one extra command after `git pull`.

```
cd ~/Projects/Craik-Computational-Usergroup
git pull
git submodule update --init
ls
```

`ls` should show `README.md`, `cheatsheets`, `corehpc`, `practice`, `scratch`, `sessions` and `setup`. Your test file from last session now lives in `scratch/`.

`corehpc/` is the lab's CoreHPC field guide. It is a **submodule**: a second repo pinned inside this one, and it is private on GitHub, so the owner added each of you as a collaborator. `ls corehpc` should list `README.md`, `docs`, `tools` and more. If it is empty, `git submodule update --init` has not run yet. If that command says `repository not found`, check `gh auth status` and ask the owner to check your access. The [git cheatsheet](../cheatsheets/git.md#submodules) explains submodules properly; we will use the guide itself once everyone has a cluster account.

Then see where you stand:

```
bash setup/check.sh
```

It prints a tick or a cross for each thing we set up today. Crosses are expected right now. We run it again at the end.

## 1. Where you are typing

A **shell** is the program that reads what you type and runs it. On a Mac the shell is **zsh**, and Terminal is the window it runs in. A few commands tell you about your own setup:

```
echo $SHELL
echo $HOME
ls -a ~
```

| What you see | What it means |
| --- | --- |
| `/bin/zsh` | The shell you are using. |
| `/Users/yourname` | Your home folder. `~` is short for it in any command. |
| `.zshrc`, `.zprofile`, `.gitconfig`, `.ssh` | Hidden settings files. Names starting with `.` are hidden from Finder and plain `ls`; `ls -a` shows them. |

Two of these files matter today:

| File | When it runs | What goes in it |
| --- | --- | --- |
| `~/.zprofile` | Once, when a Terminal window opens. | The Homebrew line from last session's installer. |
| `~/.zshrc` | Every time a shell starts, after `.zprofile`. | Everything else: prompt, plugins, aliases. |

Edits to either take effect in new windows, or right away with `source ~/.zshrc`.

The third idea is **PATH**: the list of folders the shell searches, in order, when you type a command. `command not found` means the tool is in none of them. `which` tells you which folder won:

```
echo $PATH
which git
```

If you installed Homebrew last session, `cat ~/.zprofile` shows the line that adds `/opt/homebrew/bin` to the front of that list. That is all "adding brew to your PATH" meant.

## 2. Homebrew and the tools

**Homebrew** installs command-line tools and apps on a Mac. It calls a tool a **formula** and a normal Mac app a **cask**.

### 2a. Check Homebrew

```
brew --version
```

- Prints `Homebrew 5.x`: skip to 2b.
- `command not found: brew`, and you installed it last session: your terminal doesn't know where it is. Run the three lines under [brew is not found](#brew-is-not-found) and try again.
- `command not found: brew`, never installed: run the installer. It asks for your Mac password (nothing shows as you type) and takes a few minutes.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

When it finishes it prints a few lines under **Next steps**. Copy those lines and run them, then `brew --version` works.

### 2b. Install everything at once

A **Brewfile** is a list of things for Homebrew to install. Ours is [setup/Brewfile](../setup/Brewfile); open it and read the comments, every line says what the tool is for. Install the lot:

```
brew bundle --file=setup/Brewfile
```

This takes a few minutes and ends with `brew bundle complete! 15 Brewfile dependencies now installed.` While it runs, here is what is arriving:

| Tool | What it is for |
| --- | --- |
| `git`, `gh` | A newer git than Apple's, and GitHub from the terminal. |
| `fzf` | Fuzzy finder. `Ctrl+R` searches your history. |
| `zsh-autosuggestions` | Grey suggestions from your history as you type. |
| `zsh-syntax-highlighting` | Commands turn green if they exist, red if they don't. |
| `eza` | `ls` with colours and a tree view. |
| `bat` | `cat` with colours and line numbers. |
| `fd` | `find`, but simple. |
| `ripgrep` | `grep`, but fast. The command is `rg`. |
| `tree` | Draw a folder as a tree. |
| `tlrc` | `tldr`: short examples instead of long manual pages. |
| `htop` | What is my computer doing right now. |
| `wget` | Download a file from a URL. |
| `jq` | Read and filter JSON. |
| `uv` | Python versions, environments and packages in one tool. |

### 2c. The brew commands you will actually use

| Command | What it does |
| --- | --- |
| `brew install <tool>` | Install one tool. |
| `brew install --cask <app>` | Install a normal Mac app, e.g. `brew install --cask visual-studio-code`. |
| `brew list` | What is installed. |
| `brew search <word>` | Is there a tool for this? |
| `brew info <tool>` | What a tool is, before you install it. |
| `brew upgrade` | Update everything. Once a month is plenty. |
| `brew uninstall <tool>` | Remove one. |
| `brew doctor` | Check that Homebrew itself is happy. Warnings are usually fine. |

## 3. A friendlier shell

### 3a. Oh My Zsh

**Oh My Zsh** is a set of sensible zsh settings plus a prompt that shows the git branch. Install it:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

It backs up your old `~/.zshrc` as `~/.zshrc.pre-oh-my-zsh`, writes a new one, prints a big banner, and drops you into a fresh shell. The prompt changes from

```
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup %
```

to

```
➜  Craik-Computational-Usergroup git:(main)
```

The arrow is green when the last command worked and red when it failed. `git:(main)` is the branch you are on, and a `✗` after it means you have uncommitted changes. You will never need `git status` just to find that out again.

### 3b. Our starter `.zshrc`

Oh My Zsh's file is long and mostly comments. Ours is short and turns on the tools from the Brewfile. Swap it in:

```
cp setup/zshrc.example ~/.zshrc
source ~/.zshrc
```

Open [setup/zshrc.example](../setup/zshrc.example) and read it; every block has a comment. It turns on:

- the Homebrew line, so `brew` is found even if the installer's `.zprofile` line went missing
- Oh My Zsh with its `git` plugin, which gives short aliases: `gst` is `git status`, `gl` is `git pull`, `gp` is `git push`
- `fzf`, so `Ctrl+R` searches your history
- a 100,000-line history shared between windows
- aliases `ll` (long list), `lt` (tree), `..` (up a folder), `proj` (go to `~/Projects`) and `ug` (go to this repo)
- grey suggestions and green/red highlighting

Try each of these:

1. Type `git st` and stop. The rest appears in grey from your history. Press `→` to accept it, or keep typing to ignore it.
2. Type `gti status` and look before pressing Enter: `gti` is red, because it is not a command. Fix it and it turns green.
3. Press `Ctrl+R` and type `clone`. Every `git clone` you have ever run appears; pick one with the arrows and press Enter.
4. Type `ll`, then `lt`.
5. Type `gst`.

### 3c. Make it yours

Your `.zshrc` is a text file. Open it with `nano ~/.zshrc`, add a line, save, and run `source ~/.zshrc`. An alias is a good first edit:

```
alias data='cd ~/Documents/plate-reader-exports'
```

Other knobs, all optional:

- **Colours and font size:** Terminal → Settings → Profiles. Pick a profile (Pro and Homebrew are both good on dark backgrounds), set the font to 13 or 14, and press **Default** so new windows use it.
- **Prompt style:** `ZSH_THEME` in `.zshrc`. `robbyrussell` is the default; `ls ~/.oh-my-zsh/themes` lists the rest.
- **A friendlier editor than nano:** `brew install micro`. It uses `Ctrl+S` to save and `Ctrl+Q` to quit, like a normal app.

## 4. A tour of the new tools

Run each of these from the top of the repo. One line each, to see what they look like.

```
bat README.md                           # a file, with colours and line numbers
eza -la                                 # ls, with colours and git status
eza --tree --level=2 sessions           # a folder as a tree
tree -L 1                               # the same idea, the classic way
fd csv                                  # every file with csv in its name, anywhere below here
rg thrombin practice                    # every line containing thrombin, with file names and line numbers
tldr tar                                # how do I use tar, in five examples
htop                                    # what is running. Press q to leave.
gh api user | jq .login                 # your GitHub login, pulled out of a JSON answer
wget https://raw.githubusercontent.com/kalestew/Craik-Computational-Usergroup/main/practice/plate_reader.csv -O ~/Downloads/plate_reader.csv
```

The last one downloads a file straight from GitHub into your Downloads folder. `-O` names the file it saves.

| Instead of | Try | Why |
| --- | --- | --- |
| `ls -la` | `eza -la` | Colours and git status. |
| `cat` | `bat` | Colours and line numbers. |
| `find . -name "*.csv"` | `fd csv` | No flags to remember. |
| `grep -r word .` | `rg word` | Fast, coloured, skips `.git`. |
| `man tar` | `tldr tar` | Examples instead of pages. |
| `top` | `htop` | Readable. |
| `↑` `↑` `↑` `↑` | `Ctrl+R` | Fuzzy search through everything you have typed. |

## 5. Python with uv

Your Mac already has a `python3`. It belongs to Apple's developer tools, and every project you install packages into it shares one pile of packages. Sooner or later two projects want different versions of something, and the pile breaks. The fix is one environment per project, and **uv** does that with a few commands:

| Word | What it means |
| --- | --- |
| package | Code someone else wrote that you can import: `pandas`, `matplotlib`, `biopython`. |
| environment | One project's private set of packages. |
| project | A folder with a `pyproject.toml` file listing what it needs. |

### 5a. Install a Python

```
uv python install 3.13
uv python list --only-installed
```

Once per computer. uv keeps it in `~/.local/share/uv`, away from Apple's.

### 5b. Make a project

Projects go in `~/Projects`, next to this repo, not inside it. `uv init` starts a git repo of its own, and one repo inside another gets confusing.

```
cd ~/Projects
uv init --app --no-package plate-analysis
cd plate-analysis
ls -a
```

```
.  ..  .git  .gitignore  .python-version  main.py  pyproject.toml  README.md
```

`pyproject.toml` is the important one. Open it with `bat pyproject.toml`: a name, a Python version, and an empty `dependencies = []` list. Plain `uv init` without the two flags makes a `src/` layout for building libraries; not needed yet.

### 5c. Add packages and run a script

```
uv add pandas matplotlib
```

uv downloads the packages into a hidden `.venv` folder inside the project, adds the two names to `pyproject.toml`, and writes the exact versions it chose to `uv.lock`. Now copy in the practice data and script from this repo:

```
cp ~/Projects/Craik-Computational-Usergroup/practice/plate_reader.csv .
cp ~/Projects/Craik-Computational-Usergroup/practice/analyze.py .
bat analyze.py
uv run analyze.py
open rfu.png
```

`uv run` means "run this with the project's packages". The script prints the first rows, then the mean signal for each enzyme and treatment:

```
enzyme        treatment
chymotrypsin  DMSO              35704.0
              inhibitor_10uM     3135.0
              inhibitor_1uM     13897.0
              no_substrate        213.0
elastase      DMSO              29033.0
...
Saved rfu.png
```

and `open rfu.png` shows the bar chart. Twelve lines of Python, and the file it reads is a plain CSV, the same shape as a real plate reader export.

### 5d. Interactive Python and notebooks

```
uv run python
```

```
>>> import pandas as pd
>>> df = pd.read_csv("plate_reader.csv")
>>> df[df.enzyme == "trypsin"].rfu.mean()
>>> exit()
```

For notebooks, add Jupyter to the project and start it. It is a big download, so do this later if the wifi is slow:

```
uv add jupyterlab
uv run jupyter lab
```

### 5e. Tools you just want to run

Some Python things are tools, not libraries. `uvx` runs one without making a project:

```
uvx pycowsay "hello from uv"
```

### 5f. Sharing a project

Push the project to GitHub the way you pushed this repo in session 1. Commit `pyproject.toml`, `uv.lock` and your scripts; `.venv` is already ignored. Whoever clones it runs `uv sync` and gets the same packages at the same versions.

Three habits, and the [uv cheatsheet](../cheatsheets/uv.md) has the rest:

- When a tutorial says `pip install X`, go to your project folder and run `uv add X`.
- Always `uv run script.py`, never `python script.py`. The second one uses whatever Python the shell finds first, which is not your project's.
- One folder per project. Two projects never share an environment.

## 6. Unix essentials: searching, slicing and counting a CSV

The Unix idea is small commands that each do one thing, joined with `|` so the output of one becomes the input of the next. Back in the repo:

```
cd ~/Projects/Craik-Computational-Usergroup
```

The file is `practice/plate_reader.csv`: 48 made-up wells from a protease assay, one row per well. Look at it first:

```
head practice/plate_reader.csv              # first 10 lines
head -n 3 practice/plate_reader.csv         # first 3
tail -n 3 practice/plate_reader.csv         # last 3
wc -l practice/plate_reader.csv             # how many lines
```

`wc -l` says 49: 48 wells and a header line.

### Finding rows with `grep`

```
grep trypsin practice/plate_reader.csv      # every line containing trypsin
grep -c trypsin practice/plate_reader.csv   # count them instead
```

It says 24, and there are 12 trypsin wells. *Chymotrypsin* contains the word trypsin. Make the match exact by including the commas around the field:

```
grep -c ",trypsin," practice/plate_reader.csv
```

12. That one trips up everyone once, and it is a good reason to glance at the rows and not only the count. Two filters in a row:

```
grep ",trypsin," practice/plate_reader.csv | grep DMSO
```

### Columns, sorting, counting

```
cut -d, -f2 practice/plate_reader.csv                      # column 2 only (-d, means "split on commas")
cut -d, -f2 practice/plate_reader.csv | sort | uniq -c     # ...sorted, then each value with its count
```

```
     12 chymotrypsin
     12 elastase
      1 enzyme
     12 thrombin
     12 trypsin
```

The `enzyme` line is the header. `uniq -c` only counts neighbours, which is why `sort` comes first. The five brightest wells:

```
sort -t, -k5 -n -r practice/plate_reader.csv | head -n 5
```

`-t,` split on commas, `-k5` sort by the fifth column, `-n` as numbers, `-r` biggest first.

### Saving output

`>` sends output to a file instead of the screen, replacing the file. `>>` adds to the end.

```
grep -v no_substrate practice/plate_reader.csv > ~/Desktop/with_substrate.csv
wc -l ~/Desktop/with_substrate.csv
```

`-v` keeps the lines that *don't* match. 37 lines: the header and 36 wells.

### Wildcards

`*` stands for any text:

```
ls sessions/*.md
wc -l practice/*.csv
```

### Repeating with a loop

```
for enzyme in trypsin chymotrypsin elastase thrombin; do
  echo "$enzyme: $(grep -c ",$enzyme," practice/plate_reader.csv) wells"
done
```

`$enzyme` is a variable: it takes each word in turn. `$( ... )` runs a command and drops its output into the line. Press Enter after each line; the shell waits for `done`.

### Your first script

A script is just commands in a file. Make one:

```
nano count_wells.sh
```

Type this in, save with `Ctrl+O` Enter, leave with `Ctrl+X`:

```
#!/bin/bash
# Count the wells per enzyme in a plate reader export.
file="$1"

for enzyme in $(cut -d, -f2 "$file" | tail -n +2 | sort -u); do
  echo "$enzyme: $(grep -c ",$enzyme," "$file") wells"
done
```

| Line | What it does |
| --- | --- |
| `#!/bin/bash` | Which program runs the file. Always line 1. |
| `file="$1"` | `$1` is the first word typed after the script's name. |
| `tail -n +2` | Skip the header line. |
| `sort -u` | Each enzyme once. |

Run it, then make it runnable and run it the short way:

```
bash count_wells.sh practice/plate_reader.csv
chmod +x count_wells.sh
./count_wells.sh practice/plate_reader.csv
```

```
chymotrypsin: 12 wells
elastase: 12 wells
thrombin: 12 wells
trypsin: 12 wells
```

The finished version is at [practice/count_wells.sh](../practice/count_wells.sh). Delete your copy from the top of the repo when you are done, or `git status` will nag about it.

| Command | What it does |
| --- | --- |
| `head -n 3` / `tail -n 3` | First / last 3 lines. `tail -n +2` skips line 1. |
| `wc -l` | Count lines. |
| `grep word` | Lines containing `word`. `-c` count, `-v` lines without, `-i` ignore case. |
| `cut -d, -f2` | Column 2 of a CSV. |
| `sort` | `-n` numeric, `-r` reversed, `-u` unique, `-t, -k5` by column 5. |
| `uniq -c` | Count repeated neighbours. |
| `a \| b` | Output of `a` into `b`. |
| `a > file` / `a >> file` | Save output, replacing / appending. |
| `for x in a b c; do ...; done` | Repeat for each word. |
| `chmod +x script.sh` | Make a script runnable with `./script.sh`. |

## 7. Check that it all worked

```
cd ~/Projects/Craik-Computational-Usergroup
bash setup/check.sh
```

Every line should have a tick and it should end with `All set.` Each cross names the step to go back to. Then:

- [ ] Open a new Terminal window. The prompt is `➜` with `git:(main)` inside the repo.
- [ ] Type `git st` and a grey suggestion appears.
- [ ] `Ctrl+R` opens a history search.
- [ ] `uv run analyze.py` in `~/Projects/plate-analysis` prints the table and saves `rfu.png`.
- [ ] `./count_wells.sh practice/plate_reader.csv` prints four lines.

## When things go wrong

These are the ones we expected. Add the ones we hit, with the exact text.

### `brew` is not found

```
% brew
zsh: command not found: brew
```

Homebrew is installed but not on your PATH. Run the three lines the installer printed under **Next steps**, then open a new window. On an Apple-silicon Mac they are:

```
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

On an Intel Mac, Homebrew lives in `/usr/local` instead of `/opt/homebrew`, and the installer prints the matching lines.

### A window pops up asking to install command line developer tools

Say **Install**. Homebrew needs Apple's compiler tools; the download takes a few minutes, after which the Homebrew installer carries on.

### `brew bundle` can't find the Brewfile

```
Error: No Brewfile found
```

You are not in the repo folder. `cd ~/Projects/Craik-Computational-Usergroup` and run it again.

### `brew install --cask` says the app is already there

```
Error: It seems there is already an App at '/Applications/Visual Studio Code.app'.
```

You installed that app by downloading it. Nothing to do; Homebrew just won't manage it.

### Oh My Zsh replaced my `.zshrc`

That is what it does. Your old file is at `~/.zshrc.pre-oh-my-zsh`. If you had added anything to it, copy those lines into the new file with `nano ~/.zshrc`. Our starter file already includes the Homebrew line, which is the one people usually miss.

### No colours or suggestions after copying the starter file

Run `source ~/.zshrc`, or open a new window. If `bash setup/check.sh` shows a cross next to `zsh-autosuggestions`, the Brewfile step didn't finish; run `brew bundle --file=setup/Brewfile` again.

### `zsh compinit: insecure directories`

```
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```

Press `y` this once, then fix it for good:

```
compaudit | xargs chmod g-w
```

### `uv` is not found right after installing it

Same cause as `brew`: your window predates the install. Open a new window. If that doesn't fix it, `brew --version` first; `uv` arrives through the Brewfile.

### `uv run` says there is no project

```
error: No `pyproject.toml` found in current directory or any parent directory
```

You are not inside a project folder. `cd ~/Projects/plate-analysis` and try again.

### `permission denied` running a script

```
% ./count_wells.sh practice/plate_reader.csv
zsh: permission denied: ./count_wells.sh
```

The file isn't marked runnable yet. `chmod +x count_wells.sh` once, or run it as `bash count_wells.sh ...` which never needs that.

### `Operation not permitted` reading a file in Documents or Desktop

macOS blocks Terminal from those folders until you allow it. System Settings → Privacy & Security → Files and Folders (or Full Disk Access) → turn on Terminal, then open a new window.

### `git submodule update --init` says `repository not found`

```
fatal: repository 'https://github.com/kalestew/Craik-CoreHPC.git/' not found
```

The CoreHPC repo is private. Either `gh auth status` says you are not logged in (run `gh auth login`), or your GitHub account hasn't been added as a collaborator yet; ask the owner.

## Before next time

- `bash setup/check.sh` shows `All set.` in a fresh window.
- Make a uv project of your own with a real CSV from your work in it, and get `uv run` to print something about it. Bring the question you got stuck on.
- Keep notes in `scratch/your-name.md` and push them: `git pull`, edit, `git add`, `git commit -m`, `git push`.
- Next session: the CoreHPC cluster, starting from the first page of `corehpc/README.md`, for everyone who has an account by then.

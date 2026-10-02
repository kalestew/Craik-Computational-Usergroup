# Craik Computational Usergroup

A practice repo and cheatsheet from our first session (2 October 2026), where everyone set up git, logged in to GitHub, and pushed their first commits.

This page assumes you have never used git or the command line. Everything is for a Mac, typed into the **Terminal** app. The examples marked *from our session* are real moments from [Erika's terminal log](#erikas-full-terminal-log), which is kept in full at the bottom of the page.

- [The idea in one minute](#the-idea-in-one-minute)
- [Command line basics](#command-line-basics)
- [One-time setup](#one-time-setup)
- [Getting the repo](#getting-the-repo)
- [The everyday loop](#the-everyday-loop)
- [Git cheatsheet](#git-cheatsheet)
- [When things go wrong](#when-things-go-wrong)
- [Erika's full terminal log](#erikas-full-terminal-log)

## The idea in one minute

Git saves snapshots of a folder so you can see what changed, when, and who changed it. GitHub keeps a shared copy online so a group can trade those snapshots.

```
edit files ──git add──▶ staging ──git commit──▶ your history ──git push──▶ GitHub
                                                your history ◀──git pull── GitHub
```

| Word | What it means |
| --- | --- |
| repository (repo) | A folder that git is tracking. |
| commit | One saved snapshot, with a short message describing it. |
| staging | The list of changes you have picked for the next commit. |
| remote | The shared copy on GitHub. |
| clone | Download a repo from GitHub for the first time. |
| push | Send your commits up to GitHub. |
| pull | Bring everyone else's commits down to your computer. |

## Command line basics

The terminal shows a prompt and waits for you to type a command and press Enter:

```
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup %
```

That reads as *user* `@` *computer*, then the folder you are in, then `%`. You type after the `%`. In the examples below, type only the command, not the prompt.

| Command | What it does |
| --- | --- |
| `pwd` | Show which folder you are in. |
| `ls` | List the files in this folder. |
| `cd Projects` | Move into the folder called `Projects`. |
| `cd ..` | Move up one folder. |
| `cd ~` | Go to your home folder. |
| `mkdir Projects` | Make a new folder called `Projects`. |
| `cat README.md` | Print a file's contents. |
| `nano notes.md` | Open a file in a simple editor, creating it if it doesn't exist. |

In `nano`, press `Ctrl+O` then Enter to save, and `Ctrl+X` to exit.

Habits that save a lot of trouble:

- **Press Tab to finish names.** Type the first few letters of a file or folder and press Tab. *From our session:* `cd C` failed with `cd: no such file or directory: C` because the name has to be complete. `cd C` followed by Tab fills in `cd Craik-Computational-Usergroup`.
- **Spaces matter.** *From our session:* `gitadd.` gave `zsh: command not found: gitadd.` because it is three separate words: `git add .`
- **Avoid spaces in file names.** This repo has a file called `I like wet lab`, and to read it you need quotes: `cat "I like wet lab"`. A name like `wet-lab.md` is easier to work with.
- **Press the up arrow** to bring back earlier commands instead of retyping them.
- **Press `Ctrl+C`** to cancel whatever is running and get your prompt back.
- **Passwords stay invisible.** When the terminal asks for your Mac password, nothing appears as you type. Type it and press Enter.
- **`command not found`** means a typo, or that the tool isn't installed yet.

## One-time setup

Do these once per computer.

**1. Check that git is installed.**

```
git --version
```

If your Mac offers to install the command line developer tools, say yes.

**2. Install Homebrew**, which installs other tools for you.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

When it finishes it prints a few lines under **Next steps**. Copy those lines and run them, or `brew` will not be found (see [below](#brew-is-not-found-right-after-installing-it)).

**3. Install the GitHub command line tool.**

```
brew install gh
```

**4. Log in to GitHub.**

```
gh auth login
```

Pick these answers, then paste the one-time code into the browser page that opens:

```
? Where do you use GitHub? GitHub.com
? What is your preferred protocol for Git operations on this host? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser
```

**5. Tell git who you are.** Use the email address on your GitHub account so your commits link to your profile.

```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

**6. Choose how `git pull` combines work.** This picks the simplest option, a merge.

```
git config --global pull.rebase false
```

**7. Optional: make `nano` the editor git opens** when it needs you to type a message.

```
git config --global core.editor nano
```

Check your settings any time with `git config --global --list`.

## Getting the repo

Clone it once, into whichever folder you keep projects in:

```
cd ~/Projects
git clone https://github.com/kalestew/Craik-Computational-Usergroup.git
cd Craik-Computational-Usergroup
```

After that the folder stays on your computer. Use `git pull` to update it; you don't clone again. To push to this repo, the owner has to add your GitHub account as a collaborator.

## The everyday loop

Run these from inside the repo folder.

```
git pull                        # 1. get everyone else's changes first
nano my-notes.md                # 2. make or edit files
git status                      # 3. see what changed
git add my-notes.md             # 4. pick what goes in the snapshot
git commit -m "Add my notes"    # 5. save the snapshot with a message
git push                        # 6. send it to GitHub
```

- `git status` is always safe and tells you where you are. Run it whenever you are unsure.
- `git add .` adds every change in the current folder. The `.` means "here". Naming a file adds only that file.
- The commit message goes in quotes after `-m`. Say what you changed: `"Add PCR protocol notes"` will mean more to you next month than `"update"`.
- Nothing reaches GitHub until you `git push`.

## Git cheatsheet

| Command | What it does |
| --- | --- |
| `git clone <url>` | Download a repo for the first time. |
| `git status` | Show what has changed and what is staged. |
| `git add <file>` | Stage one file for the next commit. |
| `git add .` | Stage every change in the current folder. |
| `git commit -m "message"` | Save the staged changes as a snapshot. |
| `git push` | Send your commits to GitHub. |
| `git pull` | Bring down and merge other people's commits. |
| `git diff` | Show changes you have not staged yet. |
| `git log --oneline` | List past commits, one per line. Press `q` to exit. |
| `git log --oneline --graph` | The same, with lines showing where work was merged. |

## When things go wrong

Every message here came up in our session.

### `git add` with nothing after it

```
% git add
Nothing specified, nothing added.
hint: Maybe you wanted to say 'git add .'?
```

Git needs to know what to add. Name a file, or use `git add .` for everything.

### `git commit` says there is nothing to commit

```
% git commit
Untracked files:
	testing

nothing added to commit but untracked files present (use "git add" to track)
```

You made a file but haven't staged it. Run `git add` first, then commit.

### `git commit` complains about an editor

```
% git commit
error: there was a problem with the editor 'vi'
Please supply the message using either -m or -F option.
```

Without `-m`, git opens a text editor for the message. Give the message on the same line instead: `git commit -m "your message"`.

If you end up in a full-screen editor that ignores normal typing, you are in `vi`. Press `Esc`, type `:wq`, and press Enter to save and leave. Setup step 7 swaps it for `nano`.

### `git push` asks for a username and password, then fails

```
% git push
Username for 'https://github.com': ekcotas
Password for 'https://ekcotas@github.com':
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed
```

GitHub does not accept your account password in the terminal. Press `Ctrl+C` to get out of the prompt, log in with `gh auth login` (setup step 4), then push again.

### `gh login` is an unknown command

```
% gh login
unknown command "login" for "gh"
```

The command is `gh auth login`.

### `brew` is not found right after installing it

```
% brew
zsh: command not found: brew
```

The installer finished but your terminal doesn't know where `brew` lives yet. Scroll up to **Next steps** in the installer's output and run the lines it lists. They look like this:

```
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

### `git push` is rejected

```
% git push
 ! [rejected]        main -> main (fetch first)
hint: Updates were rejected because the remote contains work that you do not
hint: have locally.
```

Someone else pushed before you. Nothing is broken. Run `git pull` to bring their work in, then `git push` again.

### `git pull` says the branches are divergent

```
% git pull
hint: You have divergent branches and need to specify how to reconcile them.
fatal: Need to specify how to reconcile divergent branches.
```

You and someone else both made commits, and git wants to know how to combine them. Choose merge once (setup step 6) and pull again:

```
git config --global pull.rebase false
git pull
```

Git then makes a "merge commit" that joins the two histories:

```
% git pull
Merge made by the 'ort' strategy.
 I like wet lab | 1 +
 1 file changed, 1 insertion(+)
```

### Git made up a name and email for you

```
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
```

The commit worked, but it is labelled with your computer's name instead of your GitHub account. Set your name and email (setup step 5) so later commits are labelled properly.

### `git pull` says CONFLICT

We didn't run into this one, because everybody edited different files. It happens when two people change the same lines of the same file, and git needs a person to choose which version to keep. Ask for help the first time; it is easier to learn with someone next to you.

## Erika's full terminal log

Erika's terminal from the session, start to finish: cloning the repo, making a file, the first commit, installing Homebrew and `gh`, logging in, and finally pulling, merging and pushing.

<details>
<summary>Show the full log</summary>

```text
Last login: Fri Oct  2 13:25:45 on ttys000
ekcota@Erikas-MBP-2 ~ % 
ekcota@Erikas-MBP-2 ~ % cd /Users/ekcota/Projects
ekcota@Erikas-MBP-2 Projects % pwd
/Users/ekcota/Projects
ekcota@Erikas-MBP-2 Projects % git clone https://github.com/kalestew/Craik-Computational-Usergroup.git
\Cloning into 'Craik-Computational-Usergroup'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (3/3), done.
ekcota@Erikas-MBP-2 Projects % \ls
Craik-Computational-Usergroup
ekcota@Erikas-MBP-2 Projects % cd C
cd: no such file or directory: C
ekcota@Erikas-MBP-2 Projects % cd Craik-Computational-Usergroup 
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % ls
README.md
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % nano
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % ls
README.md	testing
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % cat README.md
# Craik-Computational-Usergroup
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % gitat.
zsh: command not found: gitat.
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % gitadd.
zsh: command not found: gitadd.
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git push
Username for 'https://github.com': ekcotas
Password for 'https://ekcotas@github.com': 
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/kalestew/Craik-Computational-Usergroup.git/'
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git commit
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	testing

nothing added to commit but untracked files present (use "git add" to track)
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git add
Nothing specified, nothing added.
hint: Maybe you wanted to say 'git add .'?
hint: Disable this message with "git config set advice.addEmptyPathspec false"
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git add .
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git commit
error: there was a problem with the editor 'vi'
Please supply the message using either -m or -F option.
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git commit -m "hi this is erika says kyle "
[main 602b740] hi this is erika says kyle
 Committer: Erika Cota <ekcota@Erikas-MBP-2.ucsfmedicalcenter.org>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 2 insertions(+)
 create mode 100644 testing
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git push
Username for 'https://github.com': ekcotas
Password for 'https://ekcotas@github.com': 
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/kalestew/Craik-Computational-Usergroup.git/'
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % 
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % 
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % brew
zsh: command not found: brew
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
==> Checking for `sudo` access (which may request your password)...
Password:
==> This script will install:
/opt/homebrew/bin/brew
/opt/homebrew/share/doc/homebrew
/opt/homebrew/share/man/man1/brew.1
/opt/homebrew/share/zsh/site-functions/_brew
/opt/homebrew/etc/bash_completion.d/brew
/opt/homebrew
/etc/paths.d/homebrew
==> The following new directories will be created:
/opt/homebrew/bin
/opt/homebrew/etc
/opt/homebrew/include
/opt/homebrew/lib
/opt/homebrew/sbin
/opt/homebrew/share
/opt/homebrew/var
/opt/homebrew/opt
/opt/homebrew/share/zsh
/opt/homebrew/share/zsh/site-functions
/opt/homebrew/var/homebrew
/opt/homebrew/var/homebrew/linked
/opt/homebrew/Cellar
/opt/homebrew/Caskroom
/opt/homebrew/Frameworks

Press RETURN/ENTER to continue or any other key to abort:
==> /usr/bin/sudo /usr/bin/install -d -o ekcota -g admin -m 0755 /opt/homebrew
==> Found Git: /Library/Developer/CommandLineTools/usr/bin/git
==> Downloading and installing Homebrew...
remote: Enumerating objects: 365898, done.
remote: Counting objects: 100% (1147/1147), done.
remote: Compressing objects: 100% (475/475), done.
remote: Total 365898 (delta 773), reused 750 (delta 668), pack-reused 364751 (from 4)
remote: Enumerating objects: 55, done.
remote: Counting objects: 100% (33/33), done.
remote: Total 55 (delta 33), reused 33 (delta 33), pack-reused 22 (from 1)
==> /usr/bin/sudo /usr/bin/install -o root -g wheel -m 0644 /var/folders/ll/6k91d7g96rn8rn3v7lz1gp0r0000gn/T/tmp.16Fdkb1gZZ /etc/paths.d/homebrew
==> Updating Homebrew...
==> Downloading https://ghcr.io/v2/homebrew/core/portable-ruby/blobs/sha256:e0088dff5614b39387300136ec7a5f95bf1e07589547245c919524fc9e8b4197
######################################################################################################################## 100.0%
==> Pouring portable-ruby-4.0.7.arm64_big_sur.bottle.tar.gz
==> Installation successful!

==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
Read the analytics documentation (and how to opt-out) here:
  https://docs.brew.sh/Analytics
No analytics data has been sent yet (nor will any be during this install run).

==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
  https://github.com/Homebrew/brew#donations

==> Next steps:
- Run these commands in your terminal to add Homebrew to your PATH:
    echo >> /Users/ekcota/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/ekcota/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh

ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % brew
zsh: command not found: brew
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup %  echo >> /Users/ekcota/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/ekcota/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % brew
Example usage:
  brew search TEXT|/REGEX/
  brew info [FORMULA|CASK...]
  brew install FORMULA|CASK...
  brew update
  brew upgrade [FORMULA|CASK...]
  brew uninstall FORMULA|CASK...
  brew list [FORMULA|CASK...]

Troubleshooting:
  brew config
  brew doctor
  brew install --verbose --debug FORMULA|CASK

Contributing:
  brew create URL [--no-fetch]
  brew edit [FORMULA|CASK...]

Further help:
  brew commands
  brew help [COMMAND]
  man brew
  https://docs.brew.sh
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % brew install gh
==> Downloading bottle manifests
✔︎ Bottle Manifest gh (2.102.0)                                                                     Downloaded   12.6KB/ 12.6KB
==> Would install 1 formula:
gh 2.102.0
==> Fetching downloads for: gh
✔︎ Bottle gh (2.102.0)                                                                              Downloaded   14.1MB/ 14.1MB
==> Pouring gh--2.102.0.arm64_sequoia.bottle.tar.gz
🍺  /opt/homebrew/Cellar/gh/2.102.0: 238 files, 40.4MB
==> Caveats
zsh completions have been installed to:
  /opt/homebrew/share/zsh/site-functions
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git push
Username for 'https://github.com': ^C
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % gh login
unknown command "login" for "gh"

Usage:  gh <command> <subcommand> [flags]

Available commands:
  agent-task
  alias
  api
  attestation
  auth
  browse
  cache
  co
  codespace
  completion
  config
  copilot
  discussion
  extension
  gist
  gpg-key
  issue
  label
  licenses
  org
  pr
  preview
  project
  release
  repo
  ruleset
  run
  search
  secret
  skill
  ssh-key
  status
  variable
  workflow

ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % gh login auth
unknown command "login" for "gh"

Usage:  gh <command> <subcommand> [flags]

Available commands:
  agent-task
  alias
  api
  attestation
  auth
  browse
  cache
  co
  codespace
  completion
  config
  copilot
  discussion
  extension
  gist
  gpg-key
  issue
  label
  licenses
  org
  pr
  preview
  project
  release
  repo
  ruleset
  run
  search
  secret
  skill
  ssh-key
  status
  variable
  workflow

ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % gh auth login
? Where do you use GitHub? GitHub.com
? What is your preferred protocol for Git operations on this host? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? y  [Use arrows to move, type to filter]

ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % gh auth login
? Where do you use GitHub? GitHub.com
? What is your preferred protocol for Git operations on this host? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser

! One-time code (6309-85F6) copied to clipboard
Press Enter to open https://github.com/login/device in your browser... 
✓ Authentication complete.
- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as ekcotas
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git push
To https://github.com/kalestew/Craik-Computational-Usergroup.git
 ! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'https://github.com/kalestew/Craik-Computational-Usergroup.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git pull
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (3/3), 284 bytes | 142.00 KiB/s, done.
From https://github.com/kalestew/Craik-Computational-Usergroup
   68fbc31..9356472  main       -> origin/main
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint:
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint:
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git config pull.rebase false         
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git pull
Merge made by the 'ort' strategy.
 I like wet lab | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 I like wet lab
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % git push
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 14 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (5/5), 695 bytes | 695.00 KiB/s, done.
Total 5 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/kalestew/Craik-Computational-Usergroup.git
   9356472..d501dbb  main -> main
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % ls
I like wet lab	README.md	testing
ekcota@Erikas-MBP-2 Craik-Computational-Usergroup % 
```

</details>

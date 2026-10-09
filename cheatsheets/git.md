# Git cheatsheet

[Session 1](../sessions/01-git-basics.md) explains all of this from the start, with the real error messages we hit. This page is the short version.

- [The idea](#the-idea)
- [Everyday](#everyday)
- [Looking around](#looking-around)
- [Undoing](#undoing)
- [Settings](#settings)
- [Submodules](#submodules)
- [Remotes and mirrors](#remotes-and-mirrors)

## The idea

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
| remote | A shared copy somewhere else, usually GitHub. `origin` is the one you cloned from. |
| clone | Download a repo for the first time. |
| push | Send your commits up. |
| pull | Bring everyone else's commits down. |
| branch | A named line of history. We only use `main`. |

## Everyday

Run these from inside the repo folder.

```
git pull                        # 1. get everyone else's changes first
nano my-notes.md                # 2. make or edit files
git status                      # 3. see what changed
git add my-notes.md             # 4. pick what goes in the snapshot
git commit -m "Add my notes"    # 5. save the snapshot with a message
git push                        # 6. send it to GitHub
```

| Command | What it does |
| --- | --- |
| `git clone <url>` | Download a repo for the first time. |
| `git clone --recurse-submodules <url>` | The same, filling in any submodules too. Use this one for this repo. |
| `git status` | Show what has changed and what is staged. Always safe. |
| `git add <file>` | Stage one file for the next commit. |
| `git add .` | Stage every change in the current folder. |
| `git commit -m "message"` | Save the staged changes as a snapshot. |
| `git push` | Send your commits to GitHub. |
| `git pull` | Bring down and merge other people's commits. |
| `git mv old new` | Rename or move a file so git follows it. |
| `git rm <file>` | Delete a file and stage the deletion. |

## Looking around

| Command | What it does |
| --- | --- |
| `git diff` | Changes you have not staged yet. |
| `git diff --staged` | Changes you have staged but not committed. |
| `git log --oneline` | Past commits, one per line. Press `q` to exit. |
| `git log --oneline --graph` | The same, with lines showing where work was merged. |
| `git log -3` | The last three commits in full. |
| `git show` | What the latest commit changed. |
| `git remote -v` | Where `push` and `pull` go. |
| `git submodule status` | Each submodule's folder and pinned commit. |

## Undoing

| Command | What it does |
| --- | --- |
| `git restore <file>` | Throw away your unsaved edits to one file. Gone for good. |
| `git restore --staged <file>` | Un-stage a file. Your edits stay. |
| `git commit --amend -m "better message"` | Fix the message of the last commit, before you push it. |

Anything bigger than this, ask. Nearly everything in git can be undone, but it is easier with someone next to you.

## Settings

| Command | What it does |
| --- | --- |
| `git config --global user.name "Your Name"` | The name on your commits. |
| `git config --global user.email "you@example.com"` | The email on your commits. Use your GitHub one. |
| `git config --global pull.rebase false` | Combine work with a merge when you pull. |
| `git config --global core.editor nano` | Open `nano`, not `vi`, when git needs a message. |
| `git config --global --list` | Show all of the above. |

## Submodules

The lab's CoreHPC field guide lives in `corehpc/`, but it is not a copy of the files. It is a **submodule**: a second git repo pinned inside this one at one exact commit.

Think of it as a bookmark. This repo records two facts about `corehpc/`: which repo it comes from, and which commit to show. The files themselves still belong to the other repo, with its own history, its own `git log`, and its own `git pull`.

| Word | What it means |
| --- | --- |
| submodule | Another repo checked out inside this one, pinned to a commit. |
| superproject | The outer repo. Here, that is this one. |
| `.gitmodules` | A small file at the top of the repo listing each submodule's folder and URL. |
| pin | The commit of the submodule that the superproject currently points at. |

Our `.gitmodules` says:

```
[submodule "corehpc"]
	path = corehpc
	url = https://github.com/kalestew/Craik-CoreHPC.git
	branch = main
```

### Getting the submodule

The CoreHPC repo is private on GitHub. Ask the owner to add your GitHub account as a collaborator on `kalestew/Craik-CoreHPC`, and make sure you have run `gh auth login`. Then, if you are cloning fresh:

```
git clone --recurse-submodules https://github.com/kalestew/Craik-Computational-Usergroup.git
```

If you already have the repo:

```
git pull
git submodule update --init
```

`ls corehpc` should now list `README.md`, `docs`, `tools` and more. An **empty `corehpc/` folder means the submodule was never initialised**: run `git submodule update --init` again. A plain `git clone` without `--recurse-submodules` always leaves it empty, which surprises everyone once.

### Moving the pin

`git pull` in this repo does **not** update `corehpc/`. It updates which commit we point at; the folder catches up when you run `git submodule update`. When `git status` shows `modified: corehpc (new commits)` right after a pull, that is what it is telling you.

To pull the newest CoreHPC into this repo on purpose:

```
git submodule update --remote corehpc    # 1. move corehpc/ to the newest commit on its main branch
git add corehpc                          # 2. stage the new pin (one line, not the files)
git commit -m "Bump corehpc to latest"   # 3. snapshot it
git push                                 # 4. everyone else gets the new pin with their next pull
```

Inside `corehpc/`, `git status` says `HEAD detached at <commit>`. That is normal for a submodule. It means "sitting on the pinned commit, not on a branch". Do your editing of the CoreHPC guide in its own checkout, not here.

| Command | What it does |
| --- | --- |
| `git clone --recurse-submodules <url>` | Clone a repo and fill in its submodules in one go. |
| `git submodule update --init` | Fill in empty submodule folders at the pinned commits. |
| `git submodule update` | Move submodule folders to the commits the superproject now pins. Run after `git pull`. |
| `git submodule update --remote <folder>` | Move one submodule to the newest commit on its branch, so you can commit a new pin. |
| `git submodule status` | Show each submodule's folder and pinned commit. |

## Remotes and mirrors

The CoreHPC repo's home is the lab's own GitLab server, `git.kalestew.io`, where the rest of the lab's projects live. GitHub holds a mirror so this repo can reach it. Both copies are kept identical by one machine pushing to both at once. You do not need to set this up yourself; it is here so the layout makes sense.

A **remote** is a named URL that git can push to or pull from. `origin` is the name `git clone` gives the one you cloned from; a repo can have as many as you like. The trick is that one remote can have several *push* URLs:

```
git remote add github git@github.com:kalestew/Craik-CoreHPC.git
git remote set-url --add --push origin https://git.kalestew.io/ucsf/craik-lab/Craik-CoreHPC.git
git remote set-url --add --push origin git@github.com:kalestew/Craik-CoreHPC.git
git remote -v
```

After this, `git remote -v` shows one fetch URL and two push URLs for `origin`:

```
github	git@github.com:kalestew/Craik-CoreHPC.git (fetch)
github	git@github.com:kalestew/Craik-CoreHPC.git (push)
origin	https://git.kalestew.io/ucsf/craik-lab/Craik-CoreHPC.git (fetch)
origin	https://git.kalestew.io/ucsf/craik-lab/Craik-CoreHPC.git (push)
origin	git@github.com:kalestew/Craik-CoreHPC.git (push)
```

So `git pull` reads from GitLab, and a plain `git push` sends the commit to GitLab *and* GitHub. The first time, push every branch so the mirror starts complete:

```
git push github --all
git push github --tags
```

Two things to know:

- If one host is unreachable, the push to the other still goes through and git prints the error for the one that failed. Run `git push` again once it is back.
- The mirror only stays in step if nobody commits to the GitHub copy directly. Treat GitHub as read-only for CoreHPC; changes go to GitLab, through the machine that pushes to both.

| Command | What it does |
| --- | --- |
| `git remote -v` | List remotes with their fetch and push URLs. |
| `git remote add <name> <url>` | Add a second remote under a name of your choosing. |
| `git remote set-url --add --push origin <url>` | Give `origin` an extra place to push to. Add the original URL first, or you replace it. |
| `git push <remote> --all` | Push every branch to that one remote. |

## When it says something scary

The messages we have actually seen, with what to do, are in session 1's [When things go wrong](../sessions/01-git-basics.md#when-things-go-wrong).

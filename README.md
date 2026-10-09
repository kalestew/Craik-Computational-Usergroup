# Craik Computational Usergroup

Notes, cheatsheets and step-by-step setup guides from the Craik Lab's weekly computational usergroup. Everything is written for someone who has never used a terminal, on a Mac. Each session gets its own page, and the cheatsheets collect the commands from all of them.

## When and where

Every **Friday, 1:00 to 2:30 PM**, in **Conf Room GH-S536A**. The room is booked for us as a weekly series; the next one is Friday 16 October 2026. Bring your laptop and its charger. If you can't make it, the session page goes up the same day, so you can follow it on your own and ask questions in the next one.

## Sessions

| Session | Date | What we did |
| --- | --- | --- |
| [1. Git and GitHub](sessions/01-git-basics.md) | 2 October 2026 | Installed git and Homebrew, logged in to GitHub, cloned this repo and pushed a first commit. |
| [2. Setting up your Mac](sessions/02-shell-setup.md) | 9 October 2026 | Homebrew and a dozen command-line tools, a friendlier shell with Oh My Zsh, Python with uv, and the Unix commands that make a CSV answer questions. |

Every session page has the same shape: what to do before you start, the steps we do together with a check after each, a "When things go wrong" list of the real error messages, and what to do before next time. [sessions/TEMPLATE.md](sessions/TEMPLATE.md) is the blank.

## Cheatsheets

- [Git](cheatsheets/git.md): the everyday loop, looking around, undoing, submodules, remotes.
- [Shell](cheatsheets/shell.md): moving around, files, pipes, keyboard shortcuts, the nicer tools.
- [uv](cheatsheets/uv.md): Python versions, projects and packages.

## Getting the repo

Once per computer. We all keep projects in `~/Projects`.

```
mkdir -p ~/Projects
cd ~/Projects
git clone --recurse-submodules https://github.com/kalestew/Craik-Computational-Usergroup.git
cd Craik-Computational-Usergroup
```

Then, at the start of each session:

```
cd ~/Projects/Craik-Computational-Usergroup
git pull
git submodule update --init
```

`corehpc/` is the lab's [CoreHPC field guide](corehpc/README.md): how the lab uses the UCSF cluster. It is kept in its own private repo and pinned here as a **submodule**. If the folder is empty, run `git submodule update --init`. If that says `repository not found`, ask the owner to add your GitHub account to `kalestew/Craik-CoreHPC`. The [git cheatsheet](cheatsheets/git.md#submodules) explains what a submodule is.

## What is where

```
README.md          this page
sessions/          one page per session, numbered
cheatsheets/       commands by topic
setup/             files you copy to your Mac: Brewfile, zshrc.example, check.sh
practice/          small made-up data files and scripts for exercises
scratch/           everyone's test files from the sessions; put yours here
corehpc/           the CoreHPC field guide (submodule)
```

## Check your setup

```
bash setup/check.sh
```

prints a tick or a cross for every tool from session 2 and names the step to go back to.

## Adding your own notes

This repo is for practising, so push to it. Make a file named after you in `scratch/` and run the everyday loop:

```
git pull
nano scratch/your-name.md
git add scratch/your-name.md
git commit -m "Add my notes"
git push
```

If you spot a mistake in a session page or cheatsheet, fix it and push that too. That is the point.

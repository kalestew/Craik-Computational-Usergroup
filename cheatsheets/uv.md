# uv cheatsheet

`uv` does three jobs that used to need three tools: it installs Python itself, it makes one environment per project, and it adds packages to that project. [Session 2](../sessions/02-shell-setup.md#5-python-with-uv) walks through it.

## The idea

A **project** is a folder with a `pyproject.toml` in it. That file lists the packages the project needs. `uv` keeps the packages in a hidden folder, `.venv`, inside the project, and writes the exact versions it picked to `uv.lock`. Nothing is installed into the Python that came with your Mac.

```
plate-analysis/
├── pyproject.toml     what this project needs (you commit this)
├── uv.lock            the exact versions uv chose (you commit this too)
├── .venv/             the packages themselves (never commit; uv ignores it for you)
├── .python-version    which Python this project uses
└── analyze.py         your code
```

| Word | What it means |
| --- | --- |
| package | Code someone else wrote that you can import: `pandas`, `matplotlib`, `biopython`. |
| dependency | A package your project needs. |
| environment | One project's private set of packages. Projects don't share, so they can't break each other. |
| `pyproject.toml` | The project's settings file. Readable by people; edited for you by `uv add`. |
| `uv.lock` | The exact versions, so someone else gets the same ones. |

## Commands

| Command | What it does |
| --- | --- |
| `uv python install 3.13` | Download a Python. Once per computer. |
| `uv python list --only-installed` | Which Pythons uv has. |
| `uv init --app --no-package NAME` | Make a new project folder called `NAME`. Plain `uv init` adds a `src/` layout for libraries; not needed yet. |
| `uv init --app --no-package --python 3.12 NAME` | The same, pinned to an older Python. Some bio packages lag behind. |
| `uv add pandas matplotlib` | Add packages to the project. Edits `pyproject.toml`, updates `.venv`. |
| `uv remove pandas` | Take one out. |
| `uv run analyze.py` | Run a script with the project's packages. |
| `uv run python` | An interactive Python with the project's packages. `exit()` to leave. |
| `uv run jupyter lab` | Jupyter, after `uv add jupyterlab`. |
| `uv sync` | Install everything `pyproject.toml` lists. Run this after cloning someone's project. |
| `uv tree` | Show the packages and what they pulled in. |
| `uvx TOOL` | Run a Python tool once without installing it: `uvx pycowsay hi`. |
| `uv tool install TOOL` | Install a tool for good, usable from any folder. |
| `brew upgrade uv` | Update uv itself. |

## Habits

- **One folder per project**, in `~/Projects`. Not inside this repo: `uv init` makes a git repo of its own, and one repo inside another is confusing.
- **Never `pip install`** into the Mac's Python. When a tutorial says `pip install X`, go to your project and run `uv add X`.
- **Always `uv run`.** Typing `python analyze.py` uses whatever Python the shell finds first, which is not your project's. `uv run analyze.py` is.
- **Commit `pyproject.toml` and `uv.lock`**, never `.venv`. Someone who clones your project runs `uv sync` and has what you had.

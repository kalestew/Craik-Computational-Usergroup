# Craik-Computational-Usergroup

Erika- output
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


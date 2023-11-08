# ported from eirrw/zsh-git
abbr g 'git'

abbr ga 'git add'
abbr gaa 'git add --all'
abbr gai 'git add --interactive'
abbr galias 'git_list_aliases'
# Amend the most recent local commit:
abbr gam 'git commit --amend -m' # Only change commit message (optionally 'git add' files)
abbr gama 'git commit --amend -am' # Add all modified files and change commit message
abbr gan 'git commit --amend --no-edit' # Keep commit message (optionally 'git add' files)
abbr gana 'git commit --amend --no-edit -a' # Add all modified files, but keep commit message
abbr gap 'git add --patch'

abbr gb 'git branch'
abbr gba 'git branch --all'
abbr gbd 'git branch --delete'
abbr gbdf 'git branch --delete --force'
abbr gbl 'git blame'
# 'git blame' that optionally takes line numbers:
# Usage: gbll <file> [<from line>] [<to line>]
#   E.g. gbll README.md 10
#      = gbll README.md 10 10
#      = gbll README.md 10,10
#      = git blame README.md -L 10,10
abbr gbll 'git_blame_line'
abbr gbls 'git branch --list | cat'
abbr gbs 'git bisect'
abbr gbsb 'git bisect bad'
abbr gbsg 'git bisect good'
abbr gbsr 'git bisect reset'
abbr gbss 'git bisect start'

abbr gc 'git commit --verbose'
abbr gcam 'git commit -am'
abbr gcame 'git commit --allow-empty-message -am ""'
abbr gcamg 'git commit --gpg-sign -am'
abbr gcams 'git commit --signoff -am'
abbr gcamu 'git commit -am "Update"'
abbr gcem 'git commit --allow-empty -m'
abbr gcf 'git config'
abbr gcfl 'git config --list'
abbr gcfls 'git config --list | cat'
abbr gcl 'git clone --recurse-submodules'
abbr gclcd 'git_clone_and_cd'
abbr gcm 'git commit -m'
abbr gcmg 'git commit --gpg-sign -m'
abbr gcms 'git commit --signoff -m'
# Count the number of commits on a branch:
abbr gcnt 'git_count'
abbr gcnta 'git_count_all'
abbr gco 'git checkout'
abbr gcob 'git checkout -b'
abbr gcobb 'git checkout -' # "checkout branch before"
# Check out a child commit:
# Usage: gcoc [<number of commits after HEAD>]
#   E.g. gcoc = gcoc 1   => checks out direct child
#               gcoc 2   => checks out grandchild
abbr gcoc 'git_checkout_child'
abbr gcod 'git checkout develop'
abbr gcom 'git checkout $(__git_main_branch)'
# Check out a parent commit:
# Usage: gcop [<number of commits before HEAD>]
#   E.g. gcop = gcop 1   => checks out direct parent
#               gcop 2   => checks out grandparent
abbr gcop 'git_checkout_parent'
abbr gcp 'git cherry-pick'
abbr gcpa 'git cherry-pick --abort'
abbr gcpc 'git cherry-pick --continue'

abbr gd 'git diff'
abbr gds 'git diff --staged'
# Show the diff between latest stash and local working tree:
abbr gdst 'git diff stash@{0}' # = git stash show -l
# Show the diff between latest stash and HEAD:
abbr gdsth 'git diff stash@{0} HEAD'
# Show the diff between latest stash and its original parent commit:
abbr gdstp 'git diff stash@{0}^ stash@{0}' # = git stash show -p

abbr gf 'git fetch'
abbr gfa 'git fetch --all'
abbr gfo 'git fetch origin'

# git graph branches:
abbr ggb 'git log --graph --all --simplify-by-decoration --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset%x09%C(bold green)%D%Creset%n%C(white)%ad%Creset%x09%C(bold)%s%Creset%n"'

# Ignore already tracked files:
abbr gignore 'git update-index --skip-worktree'
abbr gunignore 'git update-index --no-skip-worktree'
abbr gignored 'git ls-files -v | grep ^S'

# Best default 'git log':
abbr gl 'glog --name-status'
# View the full change history of a single file:
# Usage: glf <file> [<from line>] [<to line>]
abbr glf 'git_log_file'
# Fancy 'git log --graph':
abbr glg 'glog --graph'
# Fancy 'git log --graph --oneline':
abbr glgo 'git log --graph --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s    %C(bold green)%D%Creset%n"'
# Fancy 'git log --graph --stat':
abbr glgs 'glog --graph --stat'
# Fancy 'git log --oneline':
abbr glo 'git log --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s    %C(bold green)%D%Creset"'
# Locate all commits in which a specific line of code (string) was first introduced:
# Usage: gloc <Line-of-Code> [<file>]
abbr gloc 'git_locate_string'
# Regular 'git log' in style:
abbr glr 'glog --reverse --name-status'
abbr gls 'git ls-files'

abbr gm 'git merge'
abbr gmom 'git merge origin/$(__git_main_branch)'
abbr gmum 'git merge upstream/$(__git_main_branch)'
abbr gmv 'git mv'

abbr gp 'git push'
abbr gpd 'git push --delete'
abbr gpdo 'git push --delete origin'
abbr gpf 'git push --force-with-lease'
abbr gpt 'git push && git push --tags'
abbr gpl 'git pull'
abbr gplr 'git pull --rebase'
abbr gplrs 'git pull --recurse-submodules'

# `grhard` is intentionally more verbose because `--hard` is unsafe;
# there is no way to recover uncommitted changes.
# In general the `--keep` flag is preferable. It will do exactly the same,
# but abort if a file has uncommitted changes.
# Having to type 'grhard' in full will make us think twice
# about whether we REALLY want to get rid of all dirty files.
abbr gr 'git reset --mixed' # Keep changes, but unstage them (`--mixed` = default behaviour)
abbr grhard 'git reset --hard' # Remove changes, including anything uncommitted (Dangerous!)
abbr grk 'git reset --keep' # Safer version of `--hard`: reset is aborted if a file is dirty
abbr grs 'git reset --soft' # Keep changes, and keep them staged
# Reset HEAD to a previous commit:
# Usage: grh [<number of commits before HEAD>]
#   E.g. grh = grh 1   => Reset HEAD to previous commit
#              grh 2   => Reset HEAD 2 commits
abbr grh '__git_reset_head --mixed'
abbr grhhard '__git_reset_head --hard'
abbr grhk '__git_reset_head --keep'
abbr grhs '__git_reset_head --soft'
abbr grb 'git rebase'
abbr grbm 'git rebase $(__git_main_branch)'
abbr grem 'git remote'
abbr grema 'git remote add'
abbr gremrm 'git remote rm'
abbr gremset 'git remote set-url'
abbr gremsh 'git remote show'
abbr gremv 'git remote -v'
abbr grl 'git reflog' # Useful to restore lost commits after reset
abbr grm 'git rm'
abbr grt 'git restore'
abbr grts 'git restore --staged'
abbr grtsw 'git restore --source=HEAD -SW'

# Yes, I am aware gs is commonly aliased to ghostscript,
# but since my usage of ghostscript is rare compared to git,
# I can live with typing 'ghostscript' in full when necessary.
abbr gs 'git status'
abbr gsh 'git show --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n"'
# Show a specified file from stash x (defaults to lastest stash):
# Usage: gshsf <file> [<stash number>]
abbr gshsf 'git_show_stash_file'
abbr gss '__git_status_short' # Usage: gss [<number of commits>]
abbr gst 'git stash'
abbr gsta 'git stash apply'
abbr gstd 'git stash drop'
abbr gstl 'git stash list'
abbr gstls 'git stash list | cat'
abbr gstp 'git stash push'
abbr gstpop 'git stash pop'
# Show the diff between latest stash and local working tree:
abbr gstsl 'git stash show -l' # = git diff stash@{0}
# Show the diff between latest stash and its original parent commit:
abbr gstsp 'git stash show -p' # = git diff stash@{0}^! = git diff stash@{0}^ stash@{0}
abbr gsub 'git submodule'
abbr gsuba 'git submodule add'
abbr gsubi 'git submodule update --init' # Initialize submodules
abbr gsubpl 'git submodule foreach git pull'
abbr gsubplom 'git submodule foreach git pull origin $(__git_main_branch)'
abbr gsubs 'git submodule status'
abbr gsubu 'git submodule update --remote --merge' # Update submodules
abbr gsw 'git switch'
abbr gswc 'git switch -c'
abbr gswm 'git switch $(__git_main_branch)'
abbr gswd 'git switch develop'

abbr gt 'git tag'
abbr gtam 'git tag -am' # <- takes message before annotated tag name: e.g. gtam 'Release v1.0.0' v1.0.0
abbr gtsm 'git tag -sm' # GPG sign an annotated tag
abbr gtd 'git tag --delete'
abbr gtl 'git tag --list'
abbr gtls 'git tag --list | cat'

abbr gwch 'git whatchanged -p --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%n%n%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%+b%n"'

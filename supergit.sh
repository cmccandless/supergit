#!/bin/bash
# supergit.sh

source /usr/share/bash-completion/completions/git

alias g=git
__git_complete g __git_main

# Source: https://stackoverflow.com/a/5151020/3229611
git config --global alias.pushd '!f()
{
    SUBDIRECTORY_OK=1
    . $(git --exec-path)/git-sh-setup

    git symbolic-ref HEAD | sed s_refs/heads/__ >> $GIT_DIR/.pushd
    git checkout "$@"
};
f'
__git_complete git-pushd _git_checkout
__git_complete 'git pushd' _git_checkout
git config --global alias.popd '!f()
{
    SUBDIRECTORY_OK=1
    . $(git --exec-path)/git-sh-setup

    REF=$(head -n1 $GIT_DIR/.pushd)

    [ -n "$REF" ] || die "No refs to pop"
    git checkout "$REF" && sed -i -e '1d' $GIT_DIR/.pushd
};
f'

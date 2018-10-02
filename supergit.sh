#!/bin/bash
# supergit.sh

SUPERGIT_DIR=`dirname "$BASH_SOURCE"`

source /usr/share/bash-completion/completions/git

alias g=git
__git_complete g __git_main

supergit()
{
    case "$1" in
        version)
            echo "supergit 0.1.0"
        ;;
        help)
            fmt_cmd()
            {
                printf "  %-11s%s\n" "$1" "$2"
            }

            supergit version
            printf "\nCommands:\n"
            fmt_cmd version 'print supergit version info'
            fmt_cmd help 'print this message'
            fmt_cmd update 'update supergit'
            printf "\nGit Aliases:\n"
            fmt_cmd pushd 'checkout ref and save previous on stack'
            fmt_cmd popd 'checkout pushed ref'
        ;;
        update)
            (
                cd $SUPERGIT_DIR
                git pull https://github.com/cmccandless/supergit.git master:master
            )
        ;;
        *)
            echo "Unknown command \"$1\""
            return 1
        ;;
    esac
}
alias sgit=supergit

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

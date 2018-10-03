#!/bin/bash
# supergit.sh

export SUPERGIT_DIR=`dirname "$BASH_SOURCE"`

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
                git pull -f https://github.com/cmccandless/supergit.git master:master
            )
        ;;
        *)
            echo "Unknown command \"$1\""
            return 1
        ;;
    esac
}
alias sgit=supergit

for filename in $(ls $SUPERGIT_DIR/bin); do
    git config --global alias.$filename "!bash $SUPERGIT_DIR/bin/$filename"
done

git config --global alias.users '!git contributors'

source $SUPERGIT_DIR/bash-completion

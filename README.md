# supergit
Git aliases for the power user

## Installation

```
git clone https://github.com/cmccandless/supergit.git ~/.supergit &&
echo 'source ~/.supergit/supergit.sh' >> ./.bashrc
```

## Updating

`supergit update`

## Commands

### supergit

- `supergit version`
- `supergit help`
- `supergit update`

### git-pushd / git-popd

Like pushd, but for git refs. `git pushd` has the same tab-completion as `git checkout`

```Bash
$ git branch
* master
$ git pushd HEAD^
M       README.md
Note: checking out 'HEAD^'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 8a739da Initial commit
$ git popd
M       README.md
Previous HEAD position was 8a739da Initial commit
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
```

## Other aliases

- `g=git`
- `sgit=supergit`
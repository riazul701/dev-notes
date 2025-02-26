# Commands/Usage

## forgit add

* Mark changed files and stage them.

## forgit attributes

* Clone forgit gitattributes repository to: `/home/{{user-name}}/.cache/forgit/gat/repos/gitattributes/gitattributes` directory
  * Repository URL: https://github.com/gitattributes/gitattributes

* Print `.gitattributes` file content to terminal.

## forgit ignore

* Clone forgit gitignore repository to: `/home/{{user-name}}/.cache/forgit/gi/repos/dvcs/gitignore` directory
  * Repository URL: https://github.com/dvcs/gitignore

* Print `.gitignore` file content to terminal.

## forgit blame

* `git blame` : Shows which code-line written by which person.

* Print `git blame` content to terminal.

## forgit checkout_branch

* `git checkout {{branch-name}}` : Switch git branch

## forgit checkout_commit

* `git checkout {{commit-hash}}` : Checkout to git commit

## forgit checkout_tag

* `git checkout {{tag-name}}` : Checkout to git tag

## forgit stash_show

* `git stash list` : Shows git stash list

## forgit stash_push

* `git stash push` : Save git stash

## `forgit --help`

```shell
forgit: '--help' is not a valid forgit command.

The following commands are supported:
        add
        attributes
        blame
        branch_delete
        checkout_branch
        checkout_commit
        checkout_file
        checkout_tag
        cherry_pick
        cherry_pick_from_branch
        clean
        diff
        fixup
        ignore
        log
        reflog
        rebase
        reset_head
        revert_commit
        show
        stash_show
        stash_push
```

# Forgit.md

## Websites

* [wfxr/forgit => A utility tool powered by fzf for using git interactively](https://github.com/wfxr/forgit)

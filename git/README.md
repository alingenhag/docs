# Collection of useful git commands.

## Undoing the last commit

[source](https://www.git-tower.com/learn/git/faq/undo-last-commit)

```
git reset --soft HEAD~1
```
* The --soft flag makes sure that the changes in undone revisions are preserved.

````
git reset --hard HEAD~1
````
* with --hard the undone revisions are discarded.

## Revert multiple commits including merges
```
Situation: A <- B <- C <- D <- HEAD
To revert to A do the following:

$ git reset --hard A
$ git reset --soft D # (or ORIG_HEAD or @{1} [previous location of HEAD]), all of which are D
$ git commit
```
[source](https://stackoverflow.com/questions/1463340/how-to-revert-multiple-git-commits)
## Compare the last two commits with each other
```
git log -u -1
```

## Compare commit to its immediate ancestor

[source](https://stackoverflow.com/a/1195209)

```
 git log -u -1 commit
```

# Useful links

* [On undoing, fixing, or removing commits in git](https://sethrobertson.github.io/GitFixUm/fixup.html)

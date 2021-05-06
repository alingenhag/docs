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

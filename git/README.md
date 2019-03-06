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
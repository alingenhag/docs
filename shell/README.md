# Collection of useful shell commands.

## Find files that have not been accessed for a year and delete them

```
find ~/.cache/ -type f -atime +365 -print
find ~/.cache/ -type f -atime +365 -delete
```

## Find brocken symlinks
```
find /usr/local/ -xtype l ! -exec test -e {} \; -print
find /usr/local/ -xtype l ! -exec test -e {} \; -delete
```

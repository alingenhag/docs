# Collection of useful shell commands.

## find files that have not been accessed for a year and delete them

```
find ~/.cache/ -type f -atime +365 -delete
```

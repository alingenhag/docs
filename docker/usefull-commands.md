# Collection of usefull docker commands.

## Enter a stopped Docker container

[source](https://github.com/jpetazzo/nsenter/issues/27)

```
docker commit CONTAINER NEWIMAGENAME
docker run -ti --entrypoint /bin/bash NEWIMAGENAME
```

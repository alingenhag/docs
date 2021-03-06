# Collection of useful docker commands.

## Enter a stopped Docker container

[source](https://github.com/jpetazzo/nsenter/issues/27)

```
docker commit <CONTAINER> <NEWIMAGENAME>
docker run -ti --entrypoint /bin/bash <NEWIMAGENAME>
```

## Copy logs from a container to local file

```
docker logs <CONTAINER> &> log.txt
```

* &> redirects both the standard output and standard error.

## Import a compressed dump into a running mariadb/mysql docker container

```
 gunzip < dump.sql.gz|docker exec -i <CONTAINER> mysql -u<USER> -p<PASSWORD> -D<DATABASENAME>
```   

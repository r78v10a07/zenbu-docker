# Zenbu Docker 

## Build docker image

`docker build -t debian-zenbu:2.11.1 .`

## Prepare data folders in host

This is executed just the first time before starting the docker container

```
mkdir cache mysql mysql-files users 
chmod 777 cache mysql mysql-files users 
```

## Preparing mysql database folders

This step will create all mysql database users and tables

```
docker run -t -v `pwd`/mysql:/var/lib/mysql -v `pwd`/mysql-files:/var/lib/mysql-files  -v `pwd`/users:/var/lib/zenbu/users -v `pwd`/cache:/var/lib/zenbu/cache -p 8082:80 debian-zenbu:2.11.1 /sbin/init_db.sh
```

## Starting Zenbu server 

This step will start the container in a deattached mode

```
docker run -t -d -v `pwd`/mysql:/var/lib/mysql -v `pwd`/mysql-files:/var/lib/mysql-files  -v `pwd`/users:/var/lib/zenbu/users -v `pwd`/cache:/var/lib/zenbu/cache -p 8082:80 debian-zenbu:2.11.1
```

## Web site

In your browser

```
http://localhost:8082/zenbu
```

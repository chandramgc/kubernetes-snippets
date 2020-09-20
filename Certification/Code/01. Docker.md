# Docker commands

## Docker Setting
```
docker --version
```
#### Docker list of services
```
docker info
```
#### List services
```
docker log path         : /var/lib/docker
```
#### List configurations
```
docker daemon setting   : /etc/docker
```
#### Create Container
```
docker run
    -it     :   interactive
                docker run -it ubuntu bash
    -dt     :   detached
                docker run -dt ubuntu bash

Note: Ctrl P + Ctrl Q exit container without killing primary process
```
#### List all running containers
```
docker ps
```
#### List all running stopped containers
```
docker ps -a
```
#### Remove the container
```
docker rm
```
#### Connect to running container
```
docker attach
docker exec
```


## Privileges
#### For adding privilege
```
docker run --cap-add KILL ubuntu
```
#### For droping privilege
```
docker run --cap-drop KILL ubuntu
```
#### For getting all privilege
```
docker run --privileged ubuntu
```
#### For running with certain user
```
docker run --user=1001 ubuntu sleep 3600
```

## Images
#### Pull images from registry
```
docker pull
```
#### Lists all images in the local registry
```
docker images
```
#### Export a containers filesystem as a tar archive
```
docker export b8394 > ubuntu.tar
```
#### Import the contents from a tarball to create a filesystem image
```
docker import - myubuntu < ubuntu.tar
```
#### Remove one or more images
```
docker images
```
#### Commit docker images
```
docker commit 9badf ubuntu:new
```

## Network
#### Connect a container to a network
```
docker network connect
```
#### Create a network
```
docker network create
```
#### Disconnect a contaniner from a network
```
docker network disconnect
```
#### Display detailed information on one or more networks
```
docker network inspect
```
#### List networks
```
docker network ls
```
#### Remove all unused networks
```
docker network prune
```
#### Remove one or more networks
```
docker network rm
```
#### Create a docker images with custom bridge network
```
docker run -dt --network custom_bridge ubuntu bash

```
#### Install briges
```
sudo apt-get install bridge-utils -y
```
#### Show all briges
```
brctl show
```

## Storage
#### Docker bind mount (if /target is not present it will not work)
```
docker run -d --name devtest --mount type=bind,source="$(pwd)"/target,target=/app nginx:latest
```
#### Docker bind mount (if /target is not present if will create the location)
```
docker run -d --name devtest -v "$(pwd)"/target:/app:ro nginx:latest

```
#### Docker tmpfs mount (old)
```
docker run -d --name tmptest --mount type=tmpfs,destination=/app nginx:latest
```
#### Docker tmpfs mount (new)
```
docker run -d --name tmptest --tmpfs /app nginx:latest
Note:
tmpfs-size      - Size of the tmpfs mount in bytes. Unlimited by default.
tmpfs-mode      - File mode of the tmpfs in octal. For instance, 700 or 0770, Defaults ot 1777 or world-writable

```
#### Docker create volume
```
docker volume create my-vol
docker volume create --driver local --opt type=tmpfs --opt device=tmpfs --opt o=size=100m my-tmpfs
docker volume create --driver local --opt type=btrfs --opt device=/dev/sda2 my-vol
docker volume create --driver local --opt type=nfs --opt o=addr=192.168.1.1,rw --opt device=:/path/to/dir my-nfs
```
#### Docker volume mount (old)
```
docker run -d --name devtest --mount source=my-vol,target=/app nginx:latest
```
#### Docker volume mount (new)
```
docker run -d --name=nginxtext --v my-vol:/app:ro nginx:latest
```
## Build
#### Docker build
```
docker build .
docker build -t apache:2.0 .
docker build -f Dockerfile1 .
docker build -f dockerfiles/Dockerfile1 -t new_image .

```
#### Listing the process are running
```
ps fxa | grep docker -A 3
apt-get install -y iputills-ping
```







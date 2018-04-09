### Short description

##### Containers
We use 3 different containers to host web application:
1. 'fronted' - for Nginx. We use a standard image of popular bitnami/nginx. It mounts one configuration file for Nginx from the host.
1. 'snatch-app' - for executing php scripts. We build a image based of bitnami/php-fpm. **There should be curl installed by definition,
 so curl has been added to the Dockerfile.**
1. 'snatch-storage' - a standard image of Alpine Linux.
##### Storage
We use one docker volume 'snatch-volume' which is shared via 'snatch-storage' container. The
'fronted' and 'snatch-app' containers do mount the volume via the 'snatch-storage' container.
##### Docker network
There is a docker network 'snatch-tier' in bridge mode. Both 'fronted' and 'snatch-app' containers
are in the network, so 'frontend' can find 'stach-app' by its name. 

### Instruction

Let's assume docker is installed and running on the host. cd into the docker directory and perform 5 steps:  
**NB: every step starts in the docker directory.**
##### 1. step: a docker volume for the content to publish 
1. Create a new volume: `docker volume create snatch-volume` 
1. Copy the data into the volume: 
`docker run --rm -v  $(pwd)/..:/content -v snatch-volume:/app alpine cp -r /content/site /app/`
(We do assume that the 'site' folder is in the up dir) 
##### 2. step: create docker network 
`docker network create snatch-tier --driver bridge`
##### 3. step: start a container for file sharing:  
`docker run -t -d --rm --name=snatch-storage -v snatch-volume:/app alpine`
##### 4. step: build an image for the 'application server' and start the container:
1. `cd app-server`
1. `docker build -t snatch-app .`
1. `docker run -d --name php-fpm --rm --network snatch-tier --volumes-from=snatch-storage snatch-app`
##### 5. step: start Nginx  
1. `cd fronted`
1. `docker run -d -v $(pwd)/virtualhost.conf:/bitnami/nginx/conf/vhosts/yourapp.conf -p 8080:8080 --volumes-from=snatch-storage --network snatch-tier bitnami/nginx`

### Result

1. The app should be accessible at http://localhost:8080
2. If you change files on the docker volume, the change will be visible immediately via your browser.

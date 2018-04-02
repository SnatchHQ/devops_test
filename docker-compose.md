Getting started
=====
This work requires Docker Compose
https://docs.docker.com/compose/install/#prerequisites

Building container images
=====
`docker-compose build`

Configuring ports (optional)
--------
Optionally, you can change the following environment variables affecting the ports:
* NGINX_CLIENT_PORT (published port, defaults to 8080)
* NGINX_PORT (internal port exposed in Docker by nginx service, defaults to 8080)
* FPM_PORT (PHP-FPM port exposed by php-fpm service, defaults to 9000)
(the default values for these ports are defined in `.env`)

An example:
`NGINX_CLIENT_PORT=8081 docker-compose build` will configure the webpage to be available at http://localhost:8081/

This is another good example of a best practice, as detailed in https://12factor.net/config

Running
=====
`docker-compose up -d`

Verifying the deliverables
=====
1. Point your browser to http://localhost:8080 to verify it's working
2. Run `docker-compose exec nginx apt-cache show curl` to verify `curl` has been installed
```
Package: curl
Status: install ok installed
...
```
3. Run `docker-compose exec nginx curl localhost:8080` to verify `curl` is in the PATH
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Welcome to SnatchHQ</title>
...
```
4. Change anything in the visible text of `site/index.php` and refresh the page in the browser
5. Run `docker-compose ps` to verify this solution is using more than one container
```
        Name            Command    State           Ports
-----------------------------------------------------------------
devopstest_nginx_1     /start.sh   Up      0.0.0.0:8080->8080/tcp
devopstest_php-fpm_1   /start.sh   Up      9000/tcp

```

Cleaning up
-----------------
`docker-compose down`

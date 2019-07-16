*Docker with nginx, mysql and wordpress*

I use the centos image for installation of NGINX and PHP, and default mysql image for DB.

Before to use this script you need download centos and mysql 5.7 image

`docker pull centos`

`docker pull mysql:5.7`

`docker-compose up -d`

Extract the wordpress latest zip file into the www_data folder

and check in browser

Diagram sharing - Docker Container
===============

This project run a small web site in a docker container with. 


##How to use this image

* `-p LOCAL_IP_ADDR:80:80`


##Build & Run Docker Container

####Build:

`docker build --no-cache=true -t file_sharing docker-diagram-sharing/`

####Run:

`docker run --name diagram_sharing -d -p LOCAL_IP_ADDR:80:80 file_sharing`
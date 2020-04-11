# **Docker-Steam**

Dockerfile for building Steam image.

## **Usage**

Build Docker image as follows:
```console
docker build -t steam .
```
Use the following command to run:
```console
docker run --net=host -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri:/dev/dri -v /dev/shm:/dev/shm -v /run/user/1000/pulse/native:/run/user/1000/pulse/native -v steam:/home/steam --name steam steam
```
## **Author**

[Saad Ali](https://github.com/nixknight)

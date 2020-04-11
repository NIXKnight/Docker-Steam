# **Docker-Steam**

Dockerfile for building and running Steam on Linux.

## **Usage**

Build Docker image as follows:
```console
docker build -t steam .
```
Use the following command to run:
```console
docker run --net=host -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri:/dev/dri -v /dev/shm:/dev/shm -v /run/user/1000/pulse/native:/run/user/1000/pulse/native -v steam:/home/steam --name steam steam
```
Or Download and run from DockerHub:
```console
docker run --net=host -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri:/dev/dri -v /dev/shm:/dev/shm -v /run/user/1000/pulse/native:/run/user/1000/pulse/native -v steam:/home/steam --name steam nixknight/steam:latest
```
You'll have to exit Steam which will turn off the container. If you have closed the Steam window, you can turn it of by running:
```console
docker stop steam
```
Similarly, run it using:
```console
docker start steam
```
## **Author**

[Saad Ali](https://github.com/nixknight)

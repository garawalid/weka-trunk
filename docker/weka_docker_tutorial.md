# Tutorial: Getting Started with Weka Docker
by Walid Gara on May 09, 2019 using Weka 3.8.3



Weka is also available in Docker. Docker images are located in the [waikato/weka](https://hub.docker.com/r/waikato/weka) Docker Hub repository.

You can download the image and start using Weka. Image releases are tagged using the following format:

|Tags| Description |
|:---:|:---:|
|latest	| Weka stable version image|
|devel|Weka developer version image |

First, you need to install Docker in your machine. See [Install Docker](https://docs.docker.com/install/) for more details.



Download Weka Docker image

```bash
$ docker pull waikato/weka:latest
```


#### For Linux:

You need to expose your xhost so that the Docker container can display Weka GUI.
```bash
$ xhost +local:root
```
Start Weka Docker container.

```bash
$ docker run -it --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" waikato/weka:latest
```



#### For windows 10:

You need to install [VcXsrv](https://sourceforge.net/projects/vcxsrv/) and configure it, so Docker can acces to X11 display server. You can follow this [tutorial](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde).

Then, you have to get your local ip address. Run this command in the **Command Prompt**

```bash
$ ipconfig
```
Example of local ip address: `10.42.0.94`


Then start Weka container where `<ip_address>` is your local ip address.

```bash
$ docker run -it --privileged -e DISPLAY=<ip_address>:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix waikato/weka:latest
```



#### For MacOS

You need to install [XQuartz](https://www.xquartz.org/) and allow connections from network clients. See this [tutorial](https://sourabhbajaj.com/blog/2017/02/07/gui-applications-docker-mac/#install-xquartz).

Then, you have to get your local ip address.
```bash
$ ifconfig
```

Expose your xhost where `<ip_address>` is your local ip address.

```bash
$ xhost + <ip_address>
```

Start Weka container

```bash
$ docker run -d -e DISPLAY=<ip_address>:0 -v /tmp/.X11-unix:/tmp/.X11-unix waikato/weka:latest
```

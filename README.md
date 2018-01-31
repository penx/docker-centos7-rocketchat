# docker-centos7-rocketchat

A test docker container to ensure Rocket Chat installs and runs without error under Centos7.

Mainly based on instructions from https://rocket.chat/docs/installation/manual-installation/centos/

To run locally, install Docker, then:

```
git clone git@github.com:penx/docker-centos7-rocketchat.git
cd docker-centos7-rocketchat
docker build -t centos7-rocketchat .
docker run -p 3000:3000 centos7-rocketchat
```

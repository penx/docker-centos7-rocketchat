FROM centos:centos7
RUN yum -y install epel-release nano && yum -y update
RUN echo $'[mongodb] \n\
name=MongoDB Repository \n\
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/ \n\
gpgcheck=0 \n\
enabled=1' > /etc/yum.repos.d/mongodb.repo
RUN yum install -y nodejs curl GraphicsMagick npm mongodb-org-server mongodb-org gcc-c++
RUN npm install -g inherits n
RUN n 8.9.3
# Installing Rocket.Chat
RUN cd /opt && curl -L https://releases.rocket.chat/latest/download -o rocket.chat.tgz && tar zxvf rocket.chat.tgz && mv bundle Rocket.Chat
RUN yum install -y make
RUN cd /opt/Rocket.Chat/programs/server && npm install
ENV PORT=3000
ENV ROOT_URL=http://localhost:3000/
ENV MONGO_URL=mongodb://localhost:27017/rocketchat
# Mongo
RUN chkconfig mongod on
RUN mkdir /data
RUN mkdir /data/db
EXPOSE 3000
CMD mongod & cd /opt/Rocket.Chat && node main.js

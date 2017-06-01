FROM gitlab/dind:latest

RUN apt-get update -y
RUN apt-get install software-properties-common apt-transport-https -y
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update -y
RUN apt-get install -y --fix-missing openjdk-8-jdk python3 python3-pip libyaml-dev
RUN curl -L -o sbt.deb http://dl.bintray.com/sbt/debian/sbt-0.13.13.deb
RUN dpkg -i sbt.deb
RUN curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN sbt about
RUN docker-compose version

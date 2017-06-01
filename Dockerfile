FROM gitlab/dind:latest

RUN apt-get update -y
RUN apt-get install software-properties-common apt-transport-https -y
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update -y
RUN apt-get install openjdk-8-jdk -y
RUN curl -L -o sbt.deb http://dl.bintray.com/sbt/debian/sbt-0.13.13.deb
RUN dpkg -i sbt.deb
RUN sbt about

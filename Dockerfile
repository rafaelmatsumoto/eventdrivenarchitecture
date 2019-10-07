FROM ubuntu 
MAINTAINER Dayan Freitas
COPY . /home
WORKDIR /home
RUN apt-get update

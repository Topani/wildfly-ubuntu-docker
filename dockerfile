FROM ubuntu:18.04

# Setup wildfly user and home directory
RUN useradd wildfly
RUN mkdir /home/wildfly
RUN chown wildfly /home/wildfly
RUN chgrp wildfly /home/wildfly

# setup and install curl and jre 11
RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install openjdk-11-jre -y

# download and unpack wildfly
WORKDIR /home/wildfly
USER wildfly
RUN curl -o wildfly.tar.gz https://download.jboss.org/wildfly/16.0.0.Final/wildfly-16.0.0.Final.tar.gz
RUN tar -xvzf wildfly.tar.gz
RUN rm wildfly.tar.gz

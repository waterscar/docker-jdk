# Play Base Image with port and code folder exposed
FROM ubuntu:14.04
MAINTAINER Edward Xie <edward.xie@leandev.se>

RUN apt-get install -y software-properties-common \
&& add-apt-repository -y ppa:webupd8team/java

RUN apt-get update \
&& echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
&& echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
&& apt-get install -y oracle-java8-installer

RUN apt-get install -y openssh-client \
&& ssh-keygen -q -N '' -f ~/.ssh/id_rsa -t rsa -C "docker.jdk8@leandev.se"

ENV         JAVA_HOME         /usr/lib/jvm/java-8-oracle
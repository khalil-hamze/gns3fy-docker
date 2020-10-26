FROM ubuntu:19.10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y git wget curl net-tools
RUN apt-get install -y python3.8-minimal libpython3.8-stdlib python3.8-distutils
RUN apt-get install -y python3-pip
RUN apt-get install -y software-properties-common

RUN apt-get update
RUN apt-get upgrade -y
RUN add-apt-repository -y ppa:gns3/ppa

RUN apt-get update
RUN apt-get install -y gns3-server gns3-gui
RUN apt-get install -y vim iputils-ping
RUN apt-get install -y uml-utilities iptables telnet tcpdump openssh-client openssh-server

ADD gns3-py	/src/app/gns3-py
#RUN cd /src/app/gns3-py; pip3 install -r requirements.txt

ADD gns3_server.conf    /src/app/GNS3/configs/gns3_server.conf
ADD gns3_controller.conf        /src/app/GNS3/configs/gns3_controller.conf
ADD topology_container  /src/app/GNS3/projects/topology_container
ADD images      /src/app/GNS3/images

#ADD gns3_server.conf	/root/.config/GNS3/2.2/gns3_server.conf
ADD gns3_controller.conf	/root/.config/GNS3/2.2/gns3_controller.conf
ADD topology_container	/root/GNS3/projects/topology_container
ADD images	/root/GNS3/images

WORKDIR /src/misc
ADD startup.sh	startup.sh
RUN chmod a+x /src/misc/startup.sh

WORKDIR /

ENTRYPOINT cd /src/misc ; ./startup.sh

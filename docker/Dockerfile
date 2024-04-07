# Ubuntu is probably not the most optimal base image, but it works and is easy to use when one need to troubleshoot
FROM ubuntu:23.10

# basic sanity, install base tooling +  override the OS monopoly on pip
# 

RUN apt-get update && apt-get -yq install --no-install-recommends python3 python3-pip tzdata rsync && ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
ENV TZ="Europe/Stockholm"
RUN mkdir -p /root/.config/pip
COPY pip.conf /root/.config/pip/
RUN apt-get install -y curl unzip git unrar

# install node
# the shell change is needed to be able to find the node installation
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o installnvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
RUN bash -f installnvm.sh
RUN nvm install 20
RUN corepack enable
RUN mkdir -p /Peacock /Plugins
COPY start.sh /

ENTRYPOINT /start.sh

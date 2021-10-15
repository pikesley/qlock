FROM node:16

ENV PROJECT jlock
ENV PLATFORM docker
WORKDIR /opt/${PROJECT}

RUN apt-get update && apt-get install -y nginx make rsync python3.7 python3-pip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 2
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

COPY ./ /opt/${PROJECT}
COPY docker-config/bashrc /root/.bashrc

RUN npm install

RUN make dev-install

RUN ln -sf /opt/${PROJECT}/nginx/dev-site.conf /etc/nginx/sites-enabled/default

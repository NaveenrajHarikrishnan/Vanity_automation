FROM nexusprod.corp.intranet:4567/node:erbium-buster

ARG user=jenkins
ARG group=jenkins
ARG uid=1341
ARG gid=1341
RUN getent group ${gid} || groupadd -g ${gid} ${group}
RUN useradd -c "Jenkins user" -d /home/${user} -u ${uid} -g ${gid} -m ${user}

VOLUME /gamut-static-consumer-poc

USER root
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
 && apt-get install -y busybox hub jq yajl-tools \
 && apt-get clean

RUN ls -la /root
RUN chmod 755 /root

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0
ENV TERM=xterm-256color

WORKDIR /home/node

RUN usermod -a -G staff node
RUN usermod -a -G staff ${user}
RUN usermod -aG root ${user}
USER jenkins
FROM nexusprod.corp.intranet:4567/ubuntu:focal

ARG user=jenkins
ARG group=jenkins
ARG uid=1341
ARG gid=1341
RUN getent group ${gid} || groupadd -g ${gid} ${group}
RUN useradd -c "Jenkins user" -d /home/${user} -u ${uid} -g ${gid} -m ${user}

VOLUME /tmp

USER root
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo 

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0
ENV TERM=xterm-256color

RUN ls -la /root
RUN chmod 755 /root

RUN apt-get -y update && \
    apt-get -y install jq yajl-tools default-jre wget unzip curl git locales
RUN locale-gen "en_US.UTF-8"
RUN update-locale LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"

WORKDIR /home/${user}

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102-linux.zip && \
    unzip sonar-scanner-cli-4.3.0.2102-linux.zip

ENV PATH="/home/jenkins/sonar-scanner-4.3.0.2102-linux/bin:${PATH}"
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"

RUN echo -n | openssl s_client -connect sonar.foss.corp.intranet:443 </dev/null 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /home/jenkins/sonar-scanner-4.3.0.2102-linux/sonar.crt

RUN openssl x509 -outform der -in /home/jenkins/sonar-scanner-4.3.0.2102-linux/sonar.crt -out /home/jenkins/sonar-scanner-4.3.0.2102-linux/sonar.der

RUN keytool -import -noprompt -alias ctl -storepass changeit -keystore /etc/ssl/certs/java/cacerts -file /home/jenkins/sonar-scanner-4.3.0.2102-linux/sonar.der

ENV SONAR_SCANNER_OPTS="-Dcom.sun.net.ssl.checkRevocation=false -Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts -Djavax.net.ssl.keyStore=/etc/ssl/certs/java/cacerts"

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN chmod -R 777 /home/jenkins/sonar-scanner-4.3.0.2102-linux
RUN usermod -a -G staff ${user}
RUN usermod -aG root ${user}
USER jenkins
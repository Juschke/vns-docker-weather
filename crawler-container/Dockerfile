FROM ubuntu

RUN apt-get -y update && apt-get -y upgrade

# for non-interactive localization in debian/ubuntu
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Europe/Berlin
RUN apt-get install -y tzdata
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# base packages
RUN apt-get -y install vim tree curl w3m ncat less procps dumb-init bat git bc
RUN apt-get -y install iproute2 net-tools iputils-ping
RUN apt-get -y install html2text
RUN apt-get -y install openssh-server sudo
RUN apt-get -y install apache2 php
RUN apt-get -y install locales
RUN apt-get -y install mariadb-server

# set en as default locale
RUN sed  -i "s/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8


# inject init script
COPY src/init.sh /usr/bin/

# dumb-init as init process runs myinit.sh
ENTRYPOINT ["/usr/bin/dumb-init","--"]
CMD ["/usr/bin/init.sh"]


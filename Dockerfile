FROM java:8-jre
MAINTAINER Arnau Siches <arnau@ustwo.com>

ENV SAUCE_VERSION 4.4.1

WORKDIR /usr/local/sauce-connect

RUN apt-get update -qqy \
 && apt-get install -qqy \
      wget \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://saucelabs.com/downloads/sc-$SAUCE_VERSION-linux.tar.gz -O - | tar -xz
RUN echo "127.0.0.1  behat.tests" >> /etc/hosts

WORKDIR /usr/local/sauce-connect/sc-$SAUCE_VERSION-linux

ENTRYPOINT ["/usr/local/sauce-connect/sc-4.4.1-linux/bin/sc"]

EXPOSE 8032

CMD ["--version"]

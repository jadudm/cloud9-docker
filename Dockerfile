# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# Based on work by Kevin Delfour <kevin@delfour.eu>
# Extended to support occam on the Arduino
# ------------------------------------------------------------------------------
# Pull base image.
FROM debian:jessie
MAINTAINER Matt Jadud <matt@jadud.com>

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y \
  build-essential \
  supervisor \
  g++ \
  curl \
  libssl-dev \
  git \
  python \
  racket \
  vim \
  libc-ares-dev \
  uuid-dev \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386

# apache2-utils \
# libxml2-dev \


ADD occam/ /usr/local/kroc-avr/
ADD build.sh /build.sh
RUN sudo /bin/bash /build.sh

# Add supervisord conf
ADD conf/cloud9.conf /etc/supervisor/conf.d/
ADD conf/simplehttp.conf /etc/supervisor/conf.d/
ADD conf/mosquitto.conf /etc/supervisor/conf.d/
ADD conf/etc-mosquitto.conf /etc/mosquitto/mosq.conf

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /workspace
VOLUME /workspace

# Directories we want on the machine
RUN mkdir /compiled

# ------------------------------------------------------------------------------
# Expose ports.
# For the IDE
EXPOSE 80
# For downloading compiled outputs
EXPOSE 81
# For the IDE... as well?
EXPOSE 3000
# For mosquitto
EXPOSE 8338

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# Based on work by Kevin Delfour <kevin@delfour.eu>
# Extended (effectively rewritten) to support occam on the Arduino
# ------------------------------------------------------------------------------
# Pull base image.
FROM debian:jessie
MAINTAINER Matt Jadud <matt@jadud.com>

# Create a temporary directory
RUN mkdir /build

RUN dpkg --add-architecture i386

# Add mosquitto
ADD pkgs/mosquitto/mosquitto-repo.gpg.key /build/mosquitto-repo.gpg.key
ADD pkgs/mosquitto/mosquitto-jessie.list /etc/apt/sources.list.d/mosquitto-jessie.list
RUN apt-key add /build/mosquitto-repo.gpg.key

RUN apt-get update && apt-get install -y \
  build-essential \
  supervisor \
  curl \
  git \
  python \
  racket \
  vim \
  mosquitto \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386

# Install needed Racket libraries
RUN raco pkg install yaml bitsyntax

# Build Cloud9
ADD build.sh /build/build.sh
RUN /bin/bash /build/build.sh

ADD occam/ /usr/local/kroc-avr/

ADD /pkgs/mongoose /usr/bin/mongoose

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /workspace
VOLUME /workspace

# Directories we want on the machine
RUN mkdir /compiled

# Install the compilation server
ADD pkgs/plumb /plumb
ADD plumb-install.sh /build/plumb-install.sh
ADD plumb /usr/local/bin/plumb
ADD pkgs/examples /workspace/examples
RUN /bin/bash /build/plumb-install.sh

# Cleanup the build directory
RUN rm -rf /build

# Add supervisord conf
ADD conf/cloud9.conf /etc/supervisor/conf.d/
ADD conf/mosquitto.conf /etc/supervisor/conf.d/
ADD conf/mongoose.conf /etc/supervisor/conf.d/
ADD conf/plumb-server.conf /etc/supervisor/conf.d/
ADD conf/etc-mosquitto.conf /etc/mosquitto/mosq.conf

# Fix supervisor
RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
RUN update-rc.d supervisor defaults

# ------------------------------------------------------------------------------
# Expose ports.
# For the IDE
EXPOSE 80
# For downloading compiled outputs
EXPOSE 10101
# For the IDE... as well?
EXPOSE 3000
# For mosquitto
EXPOSE 8338
# For Plumbing
EXPOSE 9000

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

# Build with
# docker build -t jadudm/plumbing .
# Run With
# docker run -p 80:80 -p 3000:3000 -p 10101:10101 -p 8338:8338 -p 9000:9000 --rm --name plumbing jadudm/plumbing

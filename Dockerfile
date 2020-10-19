FROM balenalib/raspberrypi3:run

RUN install_packages \
  libpython3.5 \
  libjpeg62-turbo \
  libavahi-compat-libdnssd1 \
  libdbus-1-3 \
  libqt5sql5 \
  libqt5serialport5 \
  libqt5network5 \
  libqt5widgets5 \
  libqt5gui5 \
  libqt5core5a \
  libcec4

ARG ng_version
ENV RELEASE=${ng_version}/Hyperion-${ng_version}-Linux-armv7l

RUN curl -fsSL https://github.com/hyperion-project/hyperion.ng/releases/download/${RELEASE}.deb > /tmp/hyperion.deb && dpkg -i /tmp/hyperion.deb && rm -f /tmp/hyperion.deb

EXPOSE 8090 8091 19333 19400 19445
VOLUME /config

CMD hyperiond -u /config

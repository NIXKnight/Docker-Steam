FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN set -x; \
    echo "deb http://ftp.debian.org/debian buster main contrib non-free\ndeb http://ftp.debian.org/debian buster-updates main contrib non-free\ndeb http://security.debian.org/ buster/updates main contrib non-free" > /etc/apt/sources.list; \
    dpkg --add-architecture i386; \
    apt-get update; \
    apt-get dist-upgrade; \
    locale-gen; \
    apt-get install -y wget locales dbus-x11 libgl1:i386 mesa-vulkan-drivers:i386 libgl1-mesa-glx:i386 libxcb-xfixes0:i386 libxcb-dri2-0:i386 mesa-vulkan-drivers firmware-amd-graphics firmware-amd-graphics:i386; \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen; \
    locale-gen; \
    wget http://media.steampowered.com/client/installer/steam.deb; \
    dpkg -i steam.deb; \
    apt-get install -yf; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir -p /home/steam; \
    groupadd -g 1000 steam; \
    useradd -d /home/steam -u 1000 -g 1000 -m -s /bin/bash steam; \
    chown -R 1000:1000 /home/steam

USER steam
ENV STEAM_RUNTIME_PREFER_HOST_LIBRARIES=1
ENV HOME /home/steam
ENV PULSE_SERVER=unix:/run/user/1000/pulse/native
WORKDIR /home/steam
VOLUME /home/steam
CMD ["steam"]

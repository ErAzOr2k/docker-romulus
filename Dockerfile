FROM jlesage/baseimage-gui:ubuntu-20.04

RUN set -x && \
 dpkg --add-architecture i386 && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
  p7zip-full \
  p7zip-rar \
  unzip \
  wine32 \
  zip && \

 # Allow window decorations
 sed -i '/<decor>no<\/decor>/d' /etc/xdg/openbox/rc.xml && \
    
 # clean   
 apt-get autoclean && \
 apt-get autoremove -y && \
 rm -rf /var/lib/apt/lists/*


COPY root/ /

ENV APP_NAME="Romulus"
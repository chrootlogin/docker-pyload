FROM rootlogin/python2:latest
MAINTAINER Simon Erhardt <me+docker@rootlogin.ch>

ARG PYLOAD_SHA512="6265602073279763c5393b958ec2cc6825d51e872556d2f2141db1e2afd9a2aaded8275aac0576526f96863d768bc9ff3669e7ff31e7b9fb5c5f655bba920a8e"
ARG PYLOAD_VERSION=0.4.9
ARG UID=1502
ARG GID=1502

RUN apk add --update \
  wget \
  curl \
  unrar \
  py-curl \
  py-simplejson \
  py-feedparser \
  py-crypto \
  unzip \
  perl \
  ca-certificates \
  gcc \
  python-dev \
  musl-dev \
  libffi-dev \
  openssl-dev \
  jpeg-dev

RUN addgroup -g ${GID} pyload \
  && adduser -u ${UID} -h /opt/pyload -H -G pyload -s /sbin/nologin -D pyload

RUN cd /tmp \
  && wget -q http://github.com/pyload/pyload/releases/download/v${PYLOAD_VERSION}/pyload-src-v${PYLOAD_VERSION}.zip \
  && echo "Verifying both integrity and authenticity of pyLoad ${PYLOAD_VERSION}..." \
  && CHECKSUM=$(shasum -a 512 pyload-src-v${PYLOAD_VERSION}.zip | awk '{print $1}') \
  && if [ "${CHECKSUM}" != "${PYLOAD_SHA512}" ]; then echo "Warning! Checksum does not match!" && exit 1; fi \
  && echo "All seems good, now unpacking pyLoad ${PYLOAD_VERSION}..." \
  && unzip pyload-src-v${PYLOAD_VERSION}.zip -d /opt \
  && rm -rf /tmp/*

RUN pip install \
  baker \
  pyOpenSSL \
  Spidermonkey

RUN apk del \
  wget \
  perl \
  gcc \
  python-dev \
  musl-dev \
  libffi-dev \
  openssl-dev \
  jpeg-dev \
  && rm -rf /var/cache/apk/*

COPY config/* /tmp/pyload-config/
COPY run.sh /opt/pyload/run.sh
RUN chmod +x /opt/pyload/run.sh

VOLUME ["/config"]

EXPOSE 8000

CMD ["/opt/pyload/run.sh"]

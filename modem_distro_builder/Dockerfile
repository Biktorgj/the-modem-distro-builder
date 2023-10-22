FROM debian
ARG UNPRIV_UGID=1001
RUN set -x \
  && groupadd -g ${UNPRIV_UGID} buildusr \
  && useradd --no-create-home --home-dir /modem_build -s /bin/false --uid ${UNPRIV_UGID} --gid ${UNPRIV_UGID} -c 'build user' buildusr \
  && apt-get update \
  && apt-get install -y sudo locales file gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint xterm python3-subunit mesa-common-dev zstd liblz4-tool gcc-arm-none-eabi \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*;


COPY sync_and_build.sh /
# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8    

VOLUME ["/modem_build_vol"]
RUN mkdir -p /modem_build_vol/repos 

# USER buildusr
ENTRYPOINT ["/sync_and_build.sh"]

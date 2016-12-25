FROM debian

ENV WOK_VERSION 2.1.0
ENV GINGER_BASE_VERSION 2.1.0
ENV KIMCHI_VERSION 2.1.0

RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gcc make autoconf automake gettext git pkgconf \
                    xsltproc logrotate \
                    python-cherrypy3 python-cheetah python-pam \
                    python-m2crypto python-jsonschema \
                    python-psutil python-ldap python-lxml nginx \
                    openssl fonts-font-awesome texlive-fonts-extra \
                    python-apt sosreport python-configobj python-parted \
                    python-configobj websockify novnc python-libvirt \
                    libvirt-bin nfs-common qemu-kvm python-parted \
                    python-ethtool sosreport python-ipaddr \
                    open-iscsi python-guestfs \
                    libguestfs-tools spice-html5 python-magic \
                    python-paramiko python-pil python-augeas




RUN mkdir -p /wok /kimchi /gingerbase

RUN cd /wok && \
    git clone --recursive https://github.com/kimchi-project/wok.git . && \
    git checkout ${WOK_VERSION} && \
    git submodule update --remote && \
    ./autogen.sh --system && \
    make && \
    make install

RUN cd /gingerbase && \
    git clone --recursive https://github.com/kimchi-project/gingerbase.git . && \
    git checkout ${GINGER_BASE_VERSION} && \
    git submodule update --remote && \
    ./autogen.sh --system && \
    make && \
    make install

RUN cd /kimchi && \
    git clone --recursive https://github.com/kimchi-project/kimchi.git . && \
    git checkout ${KIMCHI_VERSION} && \
    git submodule update --remote && \
    ./autogen.sh --system && \
    make && \
    make install


WORKDIR /wok
CMD ["wokd"]
EXPOSE 8001
EXPOSE 8000
EXPOSE 8010

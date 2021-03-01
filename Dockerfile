FROM debian:buster-slim

MAINTAINER zsx <thinkernel@gmail.com>

ENV LAM_VERSION 7.4
ENV LAM_PACKAGE ldap-account-manager-${LAM_VERSION}

# Install the software that lam environment requires
RUN apt-get update && apt-get install -y \
        bzip2 \
        curl \
        ca-certificates \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Download ldap-account-manager package
RUN curl -fSsL \
    https://phoenixnap.dl.sourceforge.net/project/lam/LAM/${LAM_VERSION}/${LAM_PACKAGE}.tar.bz2 \
    -o ${LAM_PACKAGE}.tar.bz2 \
    && bzip2 -d ${LAM_PACKAGE}.tar.bz2 \
    && tar xf ${LAM_PACKAGE}.tar -C /var/lib \
    && rm -f ${LAM_PACKAGE}.tar

COPY setup.sh /usr/local/bin/setup.sh

VOLUME /var/lib/ldap-account-manager/config

CMD ["/usr/local/bin/setup.sh"]

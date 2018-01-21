FROM docker.elastic.co/beats/heartbeat:5.6.2

USER root

# Download confd
ENV CONFD_VERSION="0.14.0"
RUN curl -Lo /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
    chmod +x /usr/local/bin/confd

COPY confdir /etc/confd/
CMD confd -backend rancher

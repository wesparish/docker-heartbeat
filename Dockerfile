FROM docker.elastic.co/beats/heartbeat:6.1.2

USER root

# Download confd
ENV CONFD_VERSION="0.14.0"
RUN curl -Lo /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
    chmod +x /usr/local/bin/confd

ENV LOCATION="weshouse"

COPY confdir /etc/confd/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
# Entrypoint runs ./heartbeat
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["-e"]

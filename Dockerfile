FROM debian:jessie-slim

RUN echo "deb http://archive.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    php5-cli \
    haproxy \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN mkdir -p /etc/haproxy

COPY haproxy.cfg /etc/haproxy/haproxy.cfg
COPY flag.php /app/flag.php
COPY index.php /app/index.php
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

EXPOSE 80

CMD ["/app/start.sh"]


FROM debian:sid-slim

RUN apt-get update && apt-get install -y \
	curl \
	mariadb-server \
	mariadb-client \
	pwgen \
	build-essential \
	vim \
&& rm -rf /var/lib/apt/lists/*

ADD files/run.sh /scripts/run.sh

RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/run.sh"]
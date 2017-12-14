FROM alpine:3.6

LABEL maintainer="Anucha Nualsi <ana.cpe9@gmail.com>"

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update \
        "mariadb=10.1.26-r0" && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/apk/* && \
    chmod 755 /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh /

EXPOSE 3306
ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["mysqld"]

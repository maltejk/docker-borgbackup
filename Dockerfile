FROM alpine:edge

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache borgbackup borgmatic py3-yaml bash gettext openssh-client
ADD config/ /config/
ADD /entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

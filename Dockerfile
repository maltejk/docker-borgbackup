FROM alpine:edge@sha256:45fbb9ea28b1eb6ba9cfff9bf1c4c20c73191f6caa314284331967e56012f2f7

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache borgbackup borgmatic py3-yaml bash gettext openssh-client
ADD config/ /config/
ADD /entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

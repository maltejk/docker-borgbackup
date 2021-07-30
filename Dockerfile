FROM alpine:edge@sha256:41c5c49a317ecd79bc4cc7a6aa4ee61b9d951dc2d34f32498007c9e02a3dfb01

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache borgbackup borgmatic py3-yaml bash gettext openssh-client
ADD config/ /config/
ADD /entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

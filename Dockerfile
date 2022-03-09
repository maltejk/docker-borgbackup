FROM alpine:edge@sha256:1a4c2018cfbab67566904e18fde9bf6a5c190605bf7da0e1d181b26746a15188

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache borgbackup borgmatic py3-yaml bash gettext openssh-client
ADD config/ /config/
ADD /entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

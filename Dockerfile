FROM alpine:latest

RUN apk update && apk add tftp-hpa

ADD http://boot.ipxe.org/ipxe.pxe /var/tftpboot/pxelinux.0
RUN chmod -R o+r /var/tftpboot

EXPOSE 69/udp

ENTRYPOINT ["/usr/sbin/in.tftpd"]
CMD ["--foreground", "--user", "nobody", "--address", "0.0.0.0:69", "--verbose", "--secure", "/var/tftpboot"]

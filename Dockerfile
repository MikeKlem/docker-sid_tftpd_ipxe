FROM centos:latest

RUN yum -y install tftp-server

ADD http://boot.ipxe.org/ipxe.pxe /var/lib/tftpboot/pxelinux.0
RUN chmod -R o+r /var/lib/tftpboot

EXPOSE 69/udp

ENTRYPOINT ["/usr/sbin/in.tftpd"]
CMD ["--foreground", "--user", "nobody", "--address", "0.0.0.0:69", "--verbose", "--secure", "/var/lib/tftpboot"]

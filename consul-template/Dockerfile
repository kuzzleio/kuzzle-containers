FROM debian:jessie
MAINTAINER Kaliop

ADD https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz /root/
RUN cd /root && \
    gzip -d consul-template_0.10.0_linux_amd64.tar.gz && \
    tar xvf consul-template_0.10.0_linux_amd64.tar && \
    mv consul-template_0.10.0_linux_amd64/consul-template /usr/bin/ && \
    rm -rf /root/consul-template*

ENTRYPOINT [ "consul-template" ]
CMD [ "--help" ]

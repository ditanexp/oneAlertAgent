FROM centos
LABEL Vendor="oneAlert" \
      License=GPLv2 \
      Version=1.0v

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install wget && \
    yum clean all

RUN wget -c http://cdn.110monitor.com/open/download/4.1.3.1/alert-agent-4.1.3.1-linux-x64.tar.gz
RUN tar -zxf alert-agent-4.1.3.1-linux-x64.tar.gz
RUN chmod a+x ./alert-agent/bin/start.sh
RUN chmod a+x ./alert-agent/jre/bin/java
WORKDIR ./alert-agent/bin
CMD ["./start.sh"]

EXPOSE 164/UDP

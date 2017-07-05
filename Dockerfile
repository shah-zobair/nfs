FROM rhel7

MAINTAINER Shah Zobair <szobair@redhat.com>

# docker build -t nfs .
# docker run -it --name nfs --privileged --ipc=host --net=host --pid=host -e NAME=nfs -e IMAGE=nfs -d nfs

RUN yum update -y && \
    yum install -y nfs-utils rpcbind && yum clean all

RUN mkdir -p /NFS/registry && \
    chmod -R 777 /NFS/registry && \
    chown -R nfsnobody.nfsnobody /NFS/registry

RUN echo "/NFS/registry *(rw)" >> /etc/exports

EXPOSE 111 2049

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]

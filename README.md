# nfs
NFS server on RHEL
(Not secured, only for testing NFS mounts for OpenShift components)


Troubleshooting:

rpcinfo -p
No remote programs registered

showmount -e
clnt_create: RPC: Program not registered

Solution: Start rpcbind service on host where the container is running and restart the container

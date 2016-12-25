# kimchi

Kimchi is a virtual machine management GUI I played around with briefly.

I do not use this at present, and so it is likely this docker image will become out of date and should not be trusted.

Example usage:

```
docker run -it \
  -p 8010:8010 \
  -p 8000:8000 \
  -p 8001:8001 \
  -v /var/run/libvirt:/var/run/libvirt \
  -v /var/run/libvirtd.pid:/var/run/libvirtd.pid \
  -v /var/lib/kimchi:/var/lib/kimchi \
  -v /var/lib/libvirt:/var/lib/libvirt \
  -v /etc/libvirt:/etc/libvirt \
  -v /lib/modules:/lib/modules:ro \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/shadow:/etc/shadow:ro \
  -v /etc/group:/etc/group:ro  \
  --net=host \
  --pid=host \
  euank/kimchi
```

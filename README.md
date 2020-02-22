# Kubernetes Cluster on Raspberry PI
Uses [k3s](https://k3s.io/) and [podman](https://podman.io/).

## Setup
### Installing k3s
```sh
curl -sfL https://get.k3s.io | sh -
```

### Installing podman
[Installation instructions](https://podman.io/getting-started/installation#raspbian)

### Local registry
```sh
podman run --privileged -d \
  --name registry \
  -p 5000:5000 \
  -v /var/lib/registry:/var/lib/registry \
  --restart=always \
  registry:2
mkdir -p /var/lib/registry
sudo chmod a+rw /var/lib/registry
```
Add the follwoing
```
[registries.insecure]
registries = ['localhost:5000']
```
to `/etc/containers/registries.conf`

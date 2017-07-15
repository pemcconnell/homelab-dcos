# dcos agent image (vsphere - debian)

This image is designed specifically with a homelab in mind and should **not**
be considered as a production image.

## iso

The ISO and it's checksum are defined in `./build.sh`:

```bash
...
-var "iso_url=https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.0.0-amd64-xfce-CD-1.iso" \
-var "iso_md5_checksum=9346436c0cf1862af71cb0a03d9a703c" \
...
```

## variables

Assuming you have the following vars set up in the root of this repo:

```bash
author=foo@bar.com
vsphere_vcenter=192.168.1.300
vsphere_user=user
vsphere_password=password
vsphere_datacenter=mydc
vsphere_cluster=my-cluster
vsphere_datastore=datastore1
vsphere_authorizedkeys="ssh-rsa ABCDEF0... foo"
```

You can load them into your env by running:

```bash
export "$(cat ../../terraform.tfvars)"
```

## build

A convenience script has been added for build. Simply run:

```bash
./build.sh vmware-iso
```

You may also build a docker image using:

```bash
./build.sh docker
```

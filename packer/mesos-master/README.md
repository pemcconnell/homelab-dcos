# dcos master image (vsphere - coreos)

This image is designed specifically with a homelab in mind and should **not**
be considered as a production image.

## iso

The ISO and it's checksum are defined in `./build.sh`:

```bash
...
-var "iso_url=https://stable.release.core-os.net/amd64-usr/current/coreos_production_iso_image.iso" \
-var "iso_md5_checksum=0da9440525e04baa73b36fba46909b13" \
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

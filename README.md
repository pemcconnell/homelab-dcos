# homelab-dcos

super-simple dcos cluster for messing around with on my homelab. specifically, this has been designed to run against some dell r710's running esxi 6.5.
**this isn't at all designed for production use**

## requirements

- terraform 0.9.11+
- packer 1.0.2+
- vsphere 6.5+

## terraform

### envs

Store the following in your `terraform.tfvars` and update accordingly.

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

## packer

`cd` into the `./packer` directory and choose which image you would like to build. Each folder should have a `./build.sh` file for convenience. It's advised that you create a `.env` file in the `./packer` folder so that you can run the following command prior to `./build.sh`:

```shell
export "$(cat ../../terraform.tfvars)"
```

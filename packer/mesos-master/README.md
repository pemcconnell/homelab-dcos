# dcos master image
This image is designed specifically with a homelab esxi cluster in mind and **not** a production image.

## variables

```bash
export AUTHORIZED_KEYS=foo
export REMOTE_HOST=1.2.3.4
export REMOTE_USER=bar
export REMOTE_PASSWORD=foobar
export REMOTE_DATASTORE=datastore9
```

## run

```bash
./build.sh
```

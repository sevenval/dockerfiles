# avenga/rancher-deployment

![pulls](https://img.shields.io/docker/pulls/avenga/rancher-deployment.svg)
![size](https://images.microbadger.com/badges/image/avenga/rancher-deployment.svg)
[![commit](https://images.microbadger.com/badges/commit/avenga/rancher-deployment.svg)](https://microbadger.com/images/avenga/rancher-deployment)

Run a deployment to [Rancher][1] via generated `docker-compose.yml` and
`rancher-compose.yml` files.  It generates these files based on Go's
[Package][2] `text/template` and processed with [Gomplate][3].  The template
files `docker-compose.tmpl.yml` and `rancher-compose.tmpl.yml` are copied with
an `ONBUILD` [trigger][4].

## Environment Variables

* `DRY_RUN`: Just print the generated files and do not run a deployment.
* `RANCHER_SAVE_OUTPUT_DIR`: Takes a directory as value. If this variable is set,
  the generated files are copied to this directory. This should be
  a mounted volume to get the files out of the container. The volume **MUST NOT** be
  mounted under `/work` which is the `WORKDIR` inside the container.
* `SETUP_VOLUMES`: Set to anything but empty to setup volumes defined in `VOLUME_NAMES`
* `VOLUME_NAMES`: Space-separated list of volumes to create.
  Already created volumes will be ignored. Will only run if `SETUP_VOLUMES` is set to a non-empty value.

## Test

```bash
docker-compose run test
```
This triggers a dry run of a rancher deployment. That means it will only show
the processed output of the `example/deployment/docker-compose.tmpl.yml` and
`example/deployment/rancher-compose.tmpl.yml` files.

## Usage as Rancher CLI

You can use this image as a replacement for the rancher cli tool.
E.g.:
```bash
docker run -it --rm --entrypoint /usr/bin/rancher -v "$HOME/.rancher":/rancher \
    avenga/rancher-deployment --config /rancher/cli.json <your options>
```

[1]: https://rancher.com/docs/rancher/v1.6/en/
[2]: https://golang.org/pkg/text/template/
[3]: https://docs.gomplate.ca/
[4]: https://docs.docker.com/engine/reference/builder/#onbuild

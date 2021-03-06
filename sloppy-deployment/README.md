# avenga/sloppy-deployment

![pulls](https://img.shields.io/docker/pulls/avenga/sloppy-deployment.svg)
![size](https://images.microbadger.com/badges/image/avenga/sloppy-deployment.svg)
[![commit](https://images.microbadger.com/badges/commit/avenga/sloppy.svg)](https://microbadger.com/images/avenga/sloppy-deployment)

Run a deployment to Sloppy via `sloppy.yml`. It generates a `sloppy.yml` from a
Gomplate template file. The template file is copied ONBUILD with the name
`sloppy.tmpl.yml`. The name can be overriden with the variable
SLOPPY_TEMPLATE_FILE. The `sloppy.yml` gets generated via environment
variables.

## Variables

* *DRY_RUN*: Just print the parsed `sloppy.yml` and do not run a deployment.
* *SLOPPY_SAVE_OUTPUT_DIR*: Takes a directory as value. If this variable is set,
  the deployed `sloppy.yml` is copied to SLOPPY_SAVE_OUTPUT_DIR. This should be
  a volume to get the file out of the container. The volume **must** not be
  mounted under `/work` which is the WORKDIR inside the container.
  If DRY_RUN is also set, the file is save too.

## Test

```bash
docker-compose run test
```
This triggers a dry run of a sloppy deployment. That means it will only show the processed output of the `test/deployment/sloppy.tmpl.yml` file. For a real deployment to a `test` environment you need to remove the `DRY_RUN` env var from `docker-compose.yml`.

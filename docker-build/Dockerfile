ARG IMAGE_PREFIX="avenga/"
ARG VERSION="latest"

FROM koalaman/shellcheck-alpine:v0.6.0 as test
COPY *.sh ./
RUN find . -name "*.sh" | xargs shellcheck

FROM ${IMAGE_PREFIX}docker:${VERSION} AS release
#
# DEFAULTS
#
ENV IMAGE_PREFIX=""
ENV IMAGES=""
ENV TARGET="release"
ENV LABEL_VENDOR=""
ENV LABEL_VCS_URL=""
ENV GIT_DIFF="@~..@"
# set to anything but not empty to list the images that need a rebuild:
ENV DRY_RUN=""
# set to anything but not empty to build with cache:
ENV CACHE=""
# set to anything but not empty to avoid pulling newer versions:
ENV NO_PULL=""

COPY run.sh /
CMD ["/run.sh"]

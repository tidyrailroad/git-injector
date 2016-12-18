#!/bin/sh

SRC=${1} &&
    ( [ ! -f /root/bin/git ] || ( echo "There is already a file there." && exit 64 )) &&
    ( [ ! -d /root/bin/git ] || ( echo "There is already a directory there." && exit 65 )) &&
    ( [ ! -x /root/bin/git ] || ( echo "There is already a device there." && exit 66 )) &&
    docker pull ${GIT_IMAGE} &&
    sed \
	-e "s#\${GIT_IMAGE}#${GIT_IMAGE}#" \
	-e "s#\${SRC}#${SRC}#" \
	-e "w/root/bin/git" \
	/opt/docker/program.sh &&
    chmod 0500 /root/bin/git &&
    true

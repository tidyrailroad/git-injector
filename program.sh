#!/bin/sh

docker \
    run \
    --interactive \
    --tty \
    --rm \
    --volume ${SRC}:/usr/local/src \
    --workdir /usr/local/src \
    ${GIT_IMAGE} \
    ${@} &&
    true

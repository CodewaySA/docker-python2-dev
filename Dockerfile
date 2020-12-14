FROM codewaysa/alpine:3.10.5_20200622

LABEL org.python.version="2.7.18"
LABEL image_name="codewaysa/python2-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-2.7 but no PyLint nor wheel
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    apk add --virtual .isort-dependencies py2-futures=3.2.0-r0 && \
    apk add --virtual .pylint-dependencies py2-configparser=3.7.4-r0 py2-mccabe=0.6.1-r3 py2-singledispatch=3.4.0.3-r1 && \
    apk add --virtual .pytest-dependencies py2-atomicwrites=1.1.5-r1 py2-attrs=18.2.0-r1 py2-funcsigs=1.0.2-r2 \
            py2-more-itertools=5.0.0-r0 py2-packaging=19.0-r0 py2-parsing=2.4.0-r0 py2-pathlib2=2.3.2-r1 \
            py2-scandir=1.9.0-r2 py2-wcwidth=0.1.7-r2 && \
    apk add git=2.22.4-r0 python2=2.7.18-r0 py-setuptools=40.8.0-r1 py2-isort=4.3.19-r0 py2-tox=3.9.0-r0 && \
    pip install pylint==1.9.5 pytest==4.6.11 wheel==0.36.2 && \
    rm -rf /root/.cache /var/cache/apk/*

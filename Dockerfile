FROM codewaysa/alpine:3.10.9_20220131

LABEL org.python.version="2.7.18"
LABEL image-name="codewaysa/python2-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-2.7 but no PyLint nor wheel
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3019
RUN apk update && \
    apk add git=2.22.5-r0 python2=2.7.18-r0 && \
    python -m ensurepip --upgrade && \
    pip install --no-cache-dir --upgrade pip==20.3.4 setuptools==44.1.1 wheel==0.37.1 && \
    apk add --virtual .pylint-dependencies py2-mccabe=0.6.1-r3 && \
    apk add --virtual .pytest-dependencies py2-funcsigs=1.0.2-r2 py2-more-itertools=5.0.0-r0 && \
    apk add --virtual .sphinx-dependencies py2-alabaster=0.7.12-r1 py2-markupsafe=1.1.1-r1 && \
    apk add --virtual .pylint-build gcc=8.3.0-r0 musl-dev=1.1.22-r4 python2-dev=2.7.18-r0 && \
    pip install --no-cache-dir coverage==5.5 isort==4.3.21 pyfakefs==3.7.2 pylint==1.9.5 pytest==4.6.11 \
        pytest-cov==2.12.1 tox==3.25.0 && \
    apk del .pylint-build && \
    rm -rf /root/.cache /var/cache/apk/*

FROM codewaysa/alpine:3.15.7_20230227

LABEL org.python.version="2.7.18"
LABEL image-name="codewaysa/python2-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.15 has Python-2.7 but no PyLint nor wheel for Python2
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3019
RUN apk update && \
    apk add git=2.34.7-r0 python2=2.7.18-r4 && \
    python -m ensurepip --upgrade && \
    pip install --no-cache-dir --upgrade pip==20.3.4 setuptools==44.1.1 wheel==0.37.1 && \
    apk add --virtual .pylint-build gcc=10.3.1_git20211027-r0 musl-dev=1.2.2-r7 python2-dev=2.7.18-r4 && \
    pip install --no-cache-dir coverage==5.5 isort==4.3.21 pyfakefs==3.7.2 pylint==1.9.5 pytest==4.6.11 \
        pytest-cov==2.12.1 sphinx==1.8.6 tox==3.28.0 && \
    apk del .pylint-build && \
    rm -rf /root/.cache /var/cache/apk/*

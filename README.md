# docker-python2

This is a basic [Python2](https://www.python.org) image based on [Alpine Linux](https://alpinelinux.org), derived from `codewaysa/alpine` ([GitHub](https://www.github.com/CodewaySA/docker-alpine), [Docker Hub](https://hub.docker.com/r/codewaysa/alpine)), with development tools included.

Sources for this image are published on [GitHub](https://www.github.com/CodewaySA/docker-python2) and builds are available from [Docker Hub](https://hub.docker.com/r/codewaysa/python2).

> **WARNING**: Python2 is [no longer supported](https://devguide.python.org/devcycle/#end-of-life-branches)!
> 
> this image is only intended to help testing legacy code and should not be used in any production environment.

Tools included in this image:
* [git](https://git-scm.com) to enable installing code from Git repositories
* [isort](https://github.com/timothycrosley/isort) to lint `import`s
* [pip](https://pip.pypa.io) to install packages
* [PyLint](https://www.pylint.org) for syntax and style checks
* [pytest](https://docs.pytest.org) for code testing
* [Setuptools](https://pypi.org/project/setuptools/) to manage and build python packages
* [tox](https://tox.readthedocs.org) for test automation
* [wheel](https://github.com/pypa/wheel) for packaging

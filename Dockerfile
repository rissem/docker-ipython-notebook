FROM ubuntu:latest
Maintainer Matt Klich, Mike Risse

# Build: docker build -t docker-ipython-notebook:latest .
# Run:   docker run -d -P docker-ipython-notebook:latest

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git build-essential python-dev python-pip python-numpy python-scipy \
    python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose; \
  pip install ipython[notebook]

ADD ./notebook/ /tmp/notebook/

EXPOSE 8080
CMD ipython notebook --no-browser --ip=0.0.0.0 --port=8080 --notebook-dir=/tmp/notebook/


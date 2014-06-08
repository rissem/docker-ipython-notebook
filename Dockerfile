FROM ubuntu:latest
Maintainer Matt Klich, Mike Risse

# Build: docker build -t dockernotebook/ipython-server:latest .
# Run:   docker run -d -P dockernotebook/ipython-server:latest

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    build-essential python-dev python-pip git; \
  pip install ipython[notebook]; \
  mkdir /tmp/notebook

EXPOSE 8080
CMD ipython notebook --no-browser --ip=0.0.0.0 --port=8080 --notebook-dir=/tmp/notebook/


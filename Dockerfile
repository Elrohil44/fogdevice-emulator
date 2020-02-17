FROM python:2-alpine

RUN apk update && apk add linux-headers g++ gcc make cmake python2-dev swig \
  && mkdir /mraa /upm

COPY ./mraa /mraa/
COPY ./upm /upm/

RUN cd /mraa \
  && mkdir build \
  && cd ./build \
  && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DCMAKE_INSTALL_LIBDIR:PATH=lib -DBUILDARCH=FOGDEVICES -DBUILDSWIGNODE=OFF -DENABLEEXAMPLES=OFF ./.. \
  && make \
  && make install \
  && cd /upm \
  && mkdir build \
  && cd ./build \
  && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DCMAKE_INSTALL_LIBDIR:PATH=lib -DBUILDSWIGNODE=OFF ./.. \
  && make \
  && make install \
  && cd / \
  && rm -rf /mraa /upm

WORKDIR /app

COPY ./lm35.py .
CMD python -u lm35.py
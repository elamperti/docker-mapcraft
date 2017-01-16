FROM frolvlad/alpine-glibc
MAINTAINER Enrico Lamperti <elamperti@users.noreply.github.com>

ENV LC_ALL=C
RUN apk add --no-cache git libpng libpng-dev libjpeg-turbo libjpeg-turbo-dev \
                       boost-system boost-dev boost-program_options boost-iostreams \
                       make gcc g++ musl-dev cmake zlib-dev && \
    cd /tmp && \
    git clone https://github.com/mapcrafter/mapcrafter.git --depth=1 && \
    cd mapcrafter && \
    cmake . && \
    make && \
    make install && \
    cd / && rm -rf /tmp/mapcrafter && \
    apk del git libpng-dev libjpeg-turbo-dev \
            boost-system boost-program_options boost-iostreams \
            make gcc g++ musl-dev cmake zlib-dev

VOLUME /worlds
VOLUME /output

ENTRYPOINT ["mapcrafter"]

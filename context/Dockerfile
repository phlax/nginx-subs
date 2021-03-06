# VERSION       0.0.1

ARG BUILD_FROM=nginx

# Root stage
FROM $BUILD_FROM as root

MAINTAINER Ryan Northey <ryan@synca.io>
ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list
RUN apt-get update && apt-get install -t buster-backports --no-install-recommends --no-install-suggests -y libpython2.7

# Build stage
FROM root as builder

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -t buster-backports -y gnupg1 apt-transport-https ca-certificates python-dev apt-src git
RUN echo "deb-src https://nginx.org/packages/mainline/debian/ buster nginx" >> /etc/apt/sources.list.d/nginx.list && apt-get update
RUN apt-get build-dep -y nginx=${NGINX_VERSION}

COPY ./builder /tmp/builder

RUN ./tmp/builder/build.sh


# App stage
FROM root

COPY --from=builder /tmp/objs/ngx_python_module.so /etc/nginx/modules

ENV NGINX_TEMPLATES_0=default

RUN echo "load_module modules/ngx_python_module.so;\n$(cat /etc/nginx/nginx.conf)" > /etc/nginx/nginx.conf

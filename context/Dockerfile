

ARG BUILD_FROM=nginx:latest

FROM $BUILD_FROM

RUN apt update \
	&& apt install -y -q \
	    --no-install-recommends \
	    libnginx-mod-http-subs-filter \
        && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /var/tmp/*

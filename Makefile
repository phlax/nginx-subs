#!/usr/bin/make -f

SHELL := /bin/bash


image:
	docker build -t phlax/nginx context

hub-image:
	docker push phlax/nginx

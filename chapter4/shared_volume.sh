#!/bin/sh

docker volume create --driver local logging-example

docker run -d --rm --name plath \
	--mount type=volume,src=logging-example,dst=/data \
	dockerinaction/ch4_writer_a

docker run --rm \
	--mount type=volume,src=logging-example,dst=/data \
	alpine:latest head /data/logA

docker stop plath


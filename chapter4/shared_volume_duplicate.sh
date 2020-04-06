#!/bin/sh

docker run --name chomsky --volume /library/ss \
	alpine:latest echo "chomsky collection created!"

docker run --name lamport --volume /library/ss \
	alpine:latest echo "lamport collection created!"

docker run --name student \
	--volumes-from chomsky \
	--volumes-from lamport \
	alpine:latest ls /library/

docker inspect --format "{{json .Mounts}}" student


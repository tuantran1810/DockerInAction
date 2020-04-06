#!/bin/sh

docker run --name fowler \
	--mount type=volume,dst=/library/PoEAA \
	--mount type=bind,src=/tmp,dst=/library/DSL \
	alpine:latest \
	echo "Fowler collection created."

docker run --name knuth \
	--mount type=volume,dst=/library/TAoCP.vol1 \
	--mount type=volume,dst=/library/TAoCP.vol2 \
	--mount type=volume,dst=/library/TAoCP.vol3 \
	--mount type=volume,dst=/library/TAoCP.vol4.a \
	alpine:latest \
	echo "Knuth collection create."

docker run --name reader \
	--volumes-from fowler \
	--volumes-from knuth \
	alpine:latest ls -l /library/

docker inspect --format "{{json .Mounts}}" reader

docker run --name aggregator \
	--volumes-from fowler \
	--volumes-from knuth \
	alpine:latest \
	echo "collection created!"

docker run --rm \
	--volumes-from aggregator \
	alpine:latest \
	ls -l /library/


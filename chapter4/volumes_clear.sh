#!/bin/sh

for i in amazon google microsoft; \
do \
docker run --rm \
	--mount type=volume,src=$i,dst=/tmp \
	--entrypoint /bin/sh \
	alpine:latest -c "nslookup $i.com > /tmp/result.txt"; \
done

docker volume list

echo removing created volumes:
docker volume remove amazon google microsoft


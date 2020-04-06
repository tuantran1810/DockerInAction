LOG_SRC=$(pwd)/web_logs_example
mkdir $LOG_SRC

docker run -d --rm --name plath \
	--mount type=bind,src=$LOG_SRC,dst=/data \
	dockerinaction/ch4_writer_a

sleep 3

docker run -d --rm \
	--mount type=bind,src=$LOG_SRC,dst=/data \
	alpine:latest head /data/logA

cat ./web_logs_example/logA
docker rm -vf plath


build:
	docker build -t ggueret/docker-ethminer-cuda:ubuntu .

shell:
	docker run --rm -ti --entrypoint /bin/bash ggueret/docker-ethminer-cuda:ubuntu

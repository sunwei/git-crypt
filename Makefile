host ?= ihakula.com
keyid ?= me@sunwei.xyz
current_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

sync:
	./sync.sh $(keyid) $(host)

unlock:
	./unlock.sh

build:
	docker build -t git-crypt:latest .

push: unlock
	./docker-push.sh

shell:
	docker run --rm -it \
	 --env GPGKEY=me@sunwei.xyz.asc \
	 -v "$(current_path)key:/app/key" \
	 -v "$(current_path):/app/repo" \
	 git-crypt \
	/bin/bash
host ?= ihakula.com
keyid ?= me@sunwei.xyz
current_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

unlock:
	./unlock.sh

export-key:
	gpg2 --list-secret-keys && \
    gpg2 --export-secret-keys $(keyid) > "$(keyid).asc"

decrypt:
	docker run --rm -it \
	 -v "$(current_path)/$(keyid).asc:/app/key/gpg-private.asc" \
	 -v "$(repo):/app/repo" \
	 git-crypt \
	git-crypt unlock

sync:
	./sync.sh $(keyid) $(host)

build:
	docker build -t git-crypt:latest .

push: unlock
	./docker-push.sh

shell:
	docker run --rm -it \
	 --env GPGKEY=$(keyid).asc \
	 -v "$(current_path)key:/app/key" \
	 -v "$(current_path):/app/repo" \
	 git-crypt \
	/bin/bash
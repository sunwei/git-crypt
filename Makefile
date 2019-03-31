host ?= ihakula.com
keyid ?= me@sunwei.xyz

sync:
	./sync.sh $(keyid) $(host)

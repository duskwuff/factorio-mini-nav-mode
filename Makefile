MODNAME := $(shell jq -r .name info.json)
VERSION := $(shell jq -r .version info.json)

archive:
	git archive --format=zip --prefix=$(MODNAME)/ main -o $(MODNAME)_$(VERSION).zip

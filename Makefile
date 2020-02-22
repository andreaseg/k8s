

SUBDIRS := $(wildcard */.)


all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@
	podman build -t $@ $@/Dockerfile
	kubectl apply -f $@


.PHONY: all $(SUBDIRS)
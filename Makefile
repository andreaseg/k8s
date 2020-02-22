

MAKEFILES := $(wildcard */Makefile)
SUBDIRS := $(wildcard */.)


all: $(MAKEFILES) $(SUBDIRS)

$(MAKEFILES):
	$(MAKE) -C $@


$(SUBDIRS):
	podman build -t $@ $@/Dockerfile
	kubectl apply -f $@


.PHONY: all $(MAKEFILES) $(SUBDIRS)
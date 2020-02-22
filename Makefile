

MAKEFILES := $(wildcard */Makefile)
SUBDIRS := $(wildcard */.)


all: $(MAKEFILES) $(SUBDIRS)

$(MAKEFILES):
	$(MAKE) -C $(patsubst %/Makefile,%,$@)


$(SUBDIRS):
	podman build -t $@ $@
	kubectl apply -f $@


.PHONY: all $(MAKEFILES) $(SUBDIRS)
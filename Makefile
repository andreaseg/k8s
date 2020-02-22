

MAKEFILES := $(wildcard */Makefile)
DOCKERFILES := $(wildcard */Dockerfile)
DEPLOYMENTS := $(wildcard */.)


all: $(MAKEFILES) $(DOCKERFILES) $(DEPLOYMENTS)

$(MAKEFILES):
	$(MAKE) -C $(patsubst %/Makefile,%,$@)

$(DOCKERFILES):
	podman build -t $(patsubst %/Dockerfile,%,$@) $(patsubst %/Dockerfile,%,$@)

$(DEPLOYMENTS):
	kubectl apply -f $@


.PHONY: all $(MAKEFILES) $(DOCKERFILES) $(DEPLOYMENTS)
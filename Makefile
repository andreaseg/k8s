

MAKEFILES := $(wildcard */Makefile)
DOCKERFILES := $(wildcard */Dockerfile)
DEPLOYMENTS := $(wildcard */.)


all: $(MAKEFILES) $(DOCKERFILES) $(DEPLOYMENTS)

deploy: $(DEPLOYMENTS)

$(MAKEFILES):
	$(MAKE) -C $(patsubst %/Makefile,%,$@)

$(DOCKERFILES):
	podman build -t $(patsubst %/Dockerfile,%,$@) $(patsubst %/Dockerfile,%,$@)
	podman push localhost/$(patsubst %/Dockerfile,%,$@) docker://localhost:5000/localhost/$(patsubst %/Dockerfile,%,$@)

$(DEPLOYMENTS):
	kubectl apply -f $@


.PHONY: all $(MAKEFILES) $(DOCKERFILES) $(DEPLOYMENTS)
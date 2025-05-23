.PHONY: all help build build-all push
SHELL := /bin/bash
CKAN_VERSION=2.11.2
PYTHON_VERSION=3.10
CKAN_VERSION_MAJOR=$(shell echo $(CKAN_VERSION) | cut -d'.' -f1)
CKAN_VERSION_MINOR=$(shell echo $(CKAN_VERSION) | cut -d'.' -f2)
TAG_NAME="mjanez/ckan-spatial-dev:$(CKAN_VERSION)"
ALT_TAG_NAME="mjanez/ckan-spatial-dev:$(CKAN_VERSION_MAJOR).$(CKAN_VERSION_MINOR)"
PYTHON_TAG_NAME="mjanez/ckan-spatial-dev:$(CKAN_VERSION)-py$(PYTHON_VERSION)"
PYTHON_ALT_TAG_NAME="mjanez/ckan-spatial-dev:$(CKAN_VERSION_MAJOR).$(CKAN_VERSION_MINOR)-py$(PYTHON_VERSION)"

all: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build a CKAN 2.11 dev image , `make build`
	echo "Building $(TAG_NAME) images"
	docker build --build-arg="CKAN_VERSION=ckan-$(CKAN_VERSION)" -t $(TAG_NAME) -t $(ALT_TAG_NAME) -t $(PYTHON_TAG_NAME) -t $(PYTHON_ALT_TAG_NAME) .

push: ## Push a CKAN 2.11 dev image to the DockerHub registry, `make push`
	echo "Pushing $(TAG_NAME) image"
	docker push $(TAG_NAME)
	echo "Pushing $(ALT_TAG_NAME) image"
	docker push $(ALT_TAG_NAME)
	echo "Pushing $(PYTHON_TAG_NAME) image"
	docker push $(PYTHON_TAG_NAME)
	echo "Pushing $(PYTHON_ALT_TAG_NAME) image"
	docker push $(PYTHON_ALT_TAG_NAME)

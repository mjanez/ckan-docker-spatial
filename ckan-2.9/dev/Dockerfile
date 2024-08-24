FROM ghcr.io/mjanez/ckan-base-spatial:ckan-2.9.12

ENV APP_DIR=/srv/app
ENV SRC_EXTENSIONS_DIR=/srv/app/src_extensions
# CKAN backports repository for >2.9.11 releases
ARG CKAN_VERSION=ckan-2.9.12
ENV GIT_ORG=derilinx
ENV GIT_REPO=ckan-backports
ENV GIT_URL=https://github.com/${GIT_ORG}/${GIT_REPO}.git
# CKAN version to build
ENV GIT_BRANCH=${CKAN_VERSION}

# Install packages needed by the dev requirements
RUN apk add --no-cache libffi-dev

# Install CKAN dev requirements
RUN pip3 install -r https://raw.githubusercontent.com/${GIT_ORG}/${GIT_REPO}/${GIT_BRANCH}/dev-requirements.txt

# Create folder for local extensions sources
RUN mkdir -p ${SRC_EXTENSIONS_DIR}

# These are used to run https on development mode
COPY setup/unsafe.cert setup/unsafe.key ${APP_DIR}

COPY setup/start_ckan_development.sh ${APP_DIR}

CMD ["/srv/app/start_ckan_development.sh"]

FROM ghcr.io/mjanez/ckan-base-spatial:ckan-2.9.11

ENV APP_DIR=/srv/app
ENV SRC_DIR=${APP_DIR}/src
ENV CKAN_DIR=${SRC_DIR}/ckan
ENV CKAN_TEST_INI=${APP_DIR}/test.ini
ENV NODE_MAJOR_VERSION="15"
# SH Scripts adapted from Natural History Museum
ARG REPO_NAME=ckan-docker-spatial
ARG REPO_URL=https://github.com/mjanez/${REPO_NAME}.git
ARG REPO_BRANCH=ckan-2.9.11-test

# Install packages needed by test requirements
RUN apk add --no-cache libffi-dev \
    netcat-openbsd \
    util-linux \
    cyrus-sasl-dev \
    libressl-dev \
    && rm -rf /var/cache/apk/*

# Install NodeJS
RUN NODE_VERSION=$(curl -sL https://unofficial-builds.nodejs.org/download/release/index.tab | grep -E "^v${NODE_MAJOR_VERSION}\." | head -n 1 | cut -f 1) && \
    curl -sL "https://unofficial-builds.nodejs.org/download/release/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64-musl.tar.xz" | tar -xJ && \
    mv node-${NODE_VERSION}-linux-x64-musl /usr/local/node && \
    ln -s /usr/local/node/bin/node /usr/local/bin/node && \
    ln -s /usr/local/node/bin/npm /usr/local/bin/npm && \
    npm update -g npm

# Clone the repository and copy the required folders for nhm custom scripts
RUN git clone --branch ${REPO_BRANCH} ${REPO_URL} /tmp/${REPO_NAME} && \
    mkdir -p ${APP_DIR}/waits && \
    mkdir -p ${APP_DIR}/scripts && \
    cp -r /tmp/${REPO_NAME}/common/waits ${APP_DIR}/waits && \
    cp -r /tmp/${REPO_NAME}/common/scripts ${APP_DIR}/scripts && \
    rm -rf /tmp/${REPO_NAME}

WORKDIR ${CKAN_DIR}

# Install CKAN dev requirements
RUN pip3 install -r dev-requirements.txt && \
    npm install . --only=prod 

WORKDIR ${APP_DIR}

# this entrypoint ensures our service dependencies (postgresql, solr and redis) are running before
# running the cmd
ENTRYPOINT ["/bin/sh", "$APP_DIR/waits/basic.sh"]

# run the tests
CMD ["/bin/sh", "$APP_DIR/scripts/run-tests.sh"]
FROM ghcr.io/mjanez/ckan-base-spatial:ckan-2.9.11

ENV APP_DIR=/srv/app
ENV SRC_DIR=${APP_DIR}/src
ENV CKAN_DIR=${SRC_DIR}/ckan
ENV CKAN_TEST_INI=${APP_DIR}/test.ini
ENV NODE_MAJOR_VERSION="18"
# SH Scripts adapted from Natural History Museum: https://github.com/NaturalHistoryMuseum/nhm-docker-ckan
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
WORKDIR /usr/local
RUN NODE_VERSION=$(wget --progress=dot:giga -qO- https://unofficial-builds.nodejs.org/download/release/index.tab | grep -E "^v${NODE_MAJOR_VERSION}\." | head -n 1 | cut -f 1) && \
    wget --progress=dot:giga "https://unofficial-builds.nodejs.org/download/release/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64-musl.tar.xz" && \
    tar -xJf node-${NODE_VERSION}-linux-x64-musl.tar.xz && \
    mv node-${NODE_VERSION}-linux-x64-musl /usr/local/node && \
    ln -s /usr/local/node/bin/node /usr/local/bin/node && \
    ln -s /usr/local/node/bin/npm /usr/local/bin/npm && \
    npm update -g npm

# Clone the repository and copy the required folders for nhm custom scripts
WORKDIR /tmp
RUN git clone --branch ${REPO_BRANCH} ${REPO_URL} /tmp/${REPO_NAME} && \
    mkdir -p ${APP_DIR}/waits && \
    mkdir -p ${APP_DIR}/scripts && \
    cp -r /tmp/${REPO_NAME}/common/waits/* ${APP_DIR}/waits/ && \
    cp -r /tmp/${REPO_NAME}/common/scripts/* ${APP_DIR}/scripts/ && \
    rm -rf /tmp/${REPO_NAME} && \
    # Ensure all scripts in waits and scripts directories have execution permissions
    chmod +x ${APP_DIR}/waits/*.sh && \
    chmod +x ${APP_DIR}/scripts/*.sh

WORKDIR ${CKAN_DIR}

# Update pip to the latest version
RUN pip3 install --upgrade pip

# Install CKAN test requirements
RUN pip3 install --no-cache-dir -r dev-requirements.txt && \
    npm install . --only=prod 

WORKDIR ${APP_DIR}

# this entrypoint ensures our service dependencies (postgresql, solr and redis) are running before
# running the cmd
ENTRYPOINT ["/srv/app/waits/basic.sh"]

# run the tests
CMD ["/bin/sh", "-c", "${APP_DIR}/scripts/run-tests.sh"]

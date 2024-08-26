FROM ghcr.io/mjanez/ckan-spatial-dev:2.9.12-py3.9

ENV CKAN_VERSION_MINOR=ckan-2.9
ENV APP_DIR=/srv/app
ENV SRC_DIR=${APP_DIR}/src
ENV CKAN_DIR=${SRC_DIR}/ckan
ENV CKAN_TEST_INI=${APP_DIR}/test.ini
ENV NODE_VERSION="18"
ENV TZ=UTC
# Custom scripts from Natural History Museum: https://github.com/NaturalHistoryMuseum/nhm-docker-ckan
ARG REPO_NAME=ckan-docker-spatial
ARG REPO_URL=https://github.com/mjanez/${REPO_NAME}.git
ARG REPO_BRANCH=ckan-2.9

# Install packages needed by test requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
        # install packages for additional bits and bobs (like the entrypoint script)
        wget \
        git \
        curl \
        uuid-runtime \
        libffi-dev \
        netcat-openbsd \
        util-linux \
        libsasl2-dev \
        libssl-dev \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

## Copy test_ckan.sh
COPY setup/test_ckan.sh ${APP_DIR}/test_ckan.sh
RUN chmod +x ${APP_DIR}/test_ckan.sh

# Conditionally install pytest-rerunfailures if CKAN version is 2.9
RUN if [ "$CKAN_VERSION_MINOR" = "ckan-2.9" ]; then \
        pip3  install -U pytest-rerunfailures; \
    fi

# Install NodeJS
RUN curl -sL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash && \
    apt-get install -q -y nodejs && \
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

# Update pip3  to the latest version
RUN pip3  install --upgrade pip

WORKDIR ${CKAN_DIR}

# Install CKAN test requirements
RUN pip3  install --no-cache-dir -r dev-requirements.txt && \
    npm install . --only=prod 

WORKDIR ${APP_DIR}

# Run the tests
CMD ["/bin/sh", "-c", "$APP_DIR/test_ckan.sh"]
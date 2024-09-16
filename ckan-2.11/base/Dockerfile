FROM python:3.10-slim-bookworm

# Neccesary for the build. Github Actions
ARG CKAN_VERSION=ckan-2.11.0

# Internals, you probably don't need to change these
ENV TZ=UTC
ENV APP_DIR=/srv/app
ENV SRC_DIR=${APP_DIR}/src
ENV CKAN_INI=${APP_DIR}/ckan.ini
ENV PIP_SRC=${SRC_DIR}
ENV CKAN_STORAGE_PATH=/var/lib/ckan
ENV GIT_URL=https://github.com/ckan/ckan.git
# CKAN version to build
ENV CKAN_VERSION=${CKAN_VERSION}
# Customize these in the environment (.env) file if needed
ENV CKAN_SITE_URL=http://localhost:5000
ENV CKAN__PLUGINS="image_view text_view datatables_view datastore envvars"

# UWSGI options
ENV UWSGI_HARAKIRI=50

WORKDIR ${APP_DIR}

# Set LC_ALL=en_US.UTF-8 will ensure that all locale-dependent operations in the current environment 
# will use English language and United States cultural conventions with UTF-8 character encoding
ENV LC_ALL=en_US.UTF-8

# Set up timezone, locale, and install system libraries
RUN echo ${TZ} > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y locales && \
    sed -i "/$LC_ALL/s/^# //g" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=${LC_ALL} && \
    # System libraries
    apt-get install --no-install-recommends -y \
        apt-utils \
        git \
        libpq-dev \
        g++ \
        linux-headers-generic \
        libtool \
        wget \
        # Set up PROJ for spatial support
        libgeos-dev \
        proj-bin \
        proj-data \
        libproj-dev \
        libcurl4-openssl-dev \
        cmake \
        libtiff-dev \
        sqlite3 \
        libsqlite3-dev \
        googletest \
        unzip && \
    # Create SRC_DIR
    mkdir -p ${SRC_DIR} && \
    # Install supervisord and create the supervisord.d directory
    apt-get install --no-install-recommends -y \
        supervisor && \
    mkdir /etc/supervisord.d && \
    # Clean system cache and lists
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

COPY setup/supervisord.conf /etc

# Install uwsgi, the CKAN application, the dependency packages for CKAN plus some confiquration
RUN pip3 install --no-cache-dir -U pip && \
    pip3 install --no-cache-dir uwsgi && \
    cd ${SRC_DIR} && \
    pip3 install --no-cache-dir -e git+${GIT_URL}@${CKAN_VERSION}#egg=ckan && \
    cd ckan && \
    pip3 install --no-cache-dir --no-binary markdown -r requirements.txt && \
    # Install CKAN envvars to support loading config from environment variables
    pip3 install --no-cache-dir -e git+https://github.com/okfn/ckanext-envvars.git@v0.0.6#egg=ckanext-envvars && \
    # Create and update CKAN config
    ckan generate config ${CKAN_INI} && \
    ckan config-tool ${CKAN_INI} "SECRET_KEY = " && \
    ckan config-tool ${CKAN_INI} "ckan.plugins = ${CKAN__PLUGINS}"

# Create a local user and group plus set up the storage path
RUN groupadd -g 92 ckan && \
    useradd -rm -d /srv/app -s /bin/bash -g ckan -u 92 ckan && \
    mkdir -p ${CKAN_STORAGE_PATH} && \
    chown -R ckan:ckan ${CKAN_STORAGE_PATH}

COPY setup/prerun.py ${APP_DIR}
COPY setup/start_ckan.sh ${APP_DIR}
ADD https://raw.githubusercontent.com/ckan/ckan/${CKAN_VERSION}/wsgi.py ${APP_DIR}
RUN chmod 644 ${APP_DIR}/wsgi.py

# Create entrypoint directory for children image scripts
ONBUILD RUN mkdir /docker-entrypoint.d

EXPOSE 5000

HEALTHCHECK --interval=60s --timeout=5s --retries=5 CMD curl --fail http://localhost:5000/api/3/action/status_show || exit CMD ["/srv/app/start_ckan.sh"]

CMD ["/srv/app/start_ckan.sh"]

FROM alpine:3.17

# Neccesary for the build. Github Actions
ARG CKAN_VERSION=ckan-2.10.7

# Internals, you probably don't need to change these
ENV TZ=UTC
ENV APP_DIR=/srv/app
ENV SRC_DIR=/srv/app/src
ENV CKAN_INI=${APP_DIR}/ckan.ini
ENV PIP_SRC=${SRC_DIR}
ENV CKAN_STORAGE_PATH=/var/lib/ckan
ENV GIT_URL=https://github.com/ckan/ckan.git
# CKAN version to build
ENV CKAN_VERSION=${CKAN_VERSION}
# Customize these on the .env file if needed
ENV CKAN_SITE_URL=http://localhost:5000
ENV CKAN__PLUGINS="image_view text_view recline_view datastore envvars"

# UWSGI options
ENV UWSGI_HARAKIRI=50

WORKDIR ${APP_DIR}

# Set up timezone
RUN apk add --no-cache tzdata  && \
    echo ${TZ} > /etc/timezone && \
    if ! [ /usr/share/zoneinfo/${TZ} -ef /etc/localtime ]; then \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime ;\
    fi

# Install necessary packages to run CKAN
RUN apk add --no-cache git \
    wget \
    gettext \
    dcron \
    postgresql-client \
    python3 \
    libxml2 \
    libxslt \
    musl-dev \
    uwsgi \
    uwsgi-http \
    uwsgi-corerouter \
    uwsgi-python \
    # Remove py3-gevent. # CKAN install a newer version of needed packages. ckan/ckan:2.10.7: https://github.com/ckan/ckan/commit/b6d88dba0483eac68d43c6adcb2521f6d6f1bacb
    #py3-gevent \
    uwsgi-gevent \
    libmagic \
    curl \
    patch \
    bash && \
    # Packages to build CKAN requirements and plugins
    apk add --no-cache --virtual .build-deps \
    postgresql-dev \
    gcc \
    make \
    g++ \
    autoconf \
    automake \
    libtool \
    python3-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    openssl-dev \
    libffi-dev \
    cargo \
    # Set up PROJ
    geos-dev \
    proj \
    proj-util \
    proj-dev \
    curl-dev \
    cmake \
    tiff-dev \
    sqlite \
    sqlite-dev \
    gtest-dev \
    unzip && \
    rm -rf /var/cache/apk/* && \
    # Create SRC_DIR
    mkdir -p ${SRC_DIR} && \
    # Install pip, supervisord and uwsgi
    curl -o ${SRC_DIR}/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3 ${SRC_DIR}/get-pip.py && \
    pip3 install --no-cache-dir supervisor && \
    mkdir /etc/supervisord.d && \
    rm -rf ${SRC_DIR}/get-pip.py

COPY setup/supervisord.conf /etc

# Install CKAN
RUN pip3 install --no-cache-dir -e git+${GIT_URL}@${CKAN_VERSION}#egg=ckan && \
    cd ${SRC_DIR}/ckan && \
    cp who.ini ${APP_DIR} && \
    pip3 install --no-cache-dir --no-binary markdown -r requirements.txt && \
    # Install CKAN envvars to support loading config from environment variables
    pip3 install --no-cache-dir -e git+https://github.com/okfn/ckanext-envvars.git@v0.0.6#egg=ckanext-envvars && \
    # Create and update CKAN config
    ckan generate config ${CKAN_INI} && \
    ckan config-tool ${CKAN_INI} "beaker.session.secret = " && \
    ckan config-tool ${CKAN_INI} "ckan.plugins = ${CKAN__PLUGINS}"

# Create a local user and group to run the app
RUN addgroup -g 92 -S ckan && \
    adduser -u 92 -h /home/ckan -s /bin/bash -D -G ckan ckan

# Create local storage folder
RUN mkdir -p ${CKAN_STORAGE_PATH} && \
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
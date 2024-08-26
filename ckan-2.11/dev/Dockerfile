FROM ghcr.io/mjanez/ckan-spatial-base:2.11.0

ENV APP_DIR=/srv/app
ENV SRC_EXTENSIONS_DIR=${APP_DIR}/src_extensions

# Install CKAN dev requirements
#RUN . ${APP_DIR}/bin/activate && \
WORKDIR ${SRC_DIR}/ckan
RUN pip3 install -r https://raw.githubusercontent.com/ckan/ckan/${CKAN_VERSION}/dev-requirements.txt

WORKDIR ${APP_DIR}


# Create folder for local extensions sources
RUN mkdir -p ${SRC_EXTENSIONS_DIR}

# These are used to run https on development mode
COPY setup/unsafe.cert setup/unsafe.key ${APP_DIR}

COPY setup/start_ckan_development.sh ${APP_DIR}

CMD ["/srv/app/start_ckan_development.sh"]

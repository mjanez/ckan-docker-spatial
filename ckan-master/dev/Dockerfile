FROM ghcr.io/mjanez/ckan-spatial-base:2.10.7

ENV APP_DIR=/srv/app
ENV SRC_EXTENSIONS_DIR=${APP_DIR}/src_extensions

USER root

# Install CKAN dev requirements
RUN cd ${SRC_DIR}/ckan && \ 
pip3 install -r https://raw.githubusercontent.com/ckan/ckan/${CKAN_VERSION}/dev-requirements.txt

COPY --chown=ckan-sys:ckan-sys setup/unsafe.cert setup/unsafe.key setup/start_ckan_development.sh setup/install_src.sh ${APP_DIR}

# Update local directories
RUN mkdir -p ${SRC_EXTENSIONS_DIR} /var/lib/ckan && \
    chown -R ckan-sys:ckan-sys ${SRC_EXTENSIONS_DIR} && \
    chown -R ckan:ckan-sys /var/lib/ckan/ && \
    chmod 775 ${SRC_EXTENSIONS_DIR}

USER ckan

CMD ["/srv/app/start_ckan_development.sh"]

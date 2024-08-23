<h1 align="center">CKAN Docker Compose - Open Data & GIS</h1>
<p align="center">
<a href="https://github.com/OpenDataGIS/ckan"><img src="https://img.shields.io/badge/Docker%20CKAN-2.9.9-brightgreen" alt="CKAN Versions"></a>


<p align="center">
    <a href="#overview">Overview</a> •
    <a href="#building-and-pushing-the-images">Building and Pushing the images</a> •
    <a href="#test-extensions-with-a-test-image">Test extensions with a test image</a> •
    <a href="#scanning-the-images-for-vulnerabilites">Scanning the images for vulnerabilites</a>
</p>

**Requirements**:
* [Docker](https://docs.docker.com/get-docker/)

## Overview
Contains [CKAN spatial images](https://github.com/mjanez/ckan-docker-spatial/pkgs/container/ckan-base-spatial) for the different components of CKAN Cloud and a [Docker compose spatial environment](https://github.com/mjanez/ckan-docker) for development and testing Open Data portals.

> [!WARNING]
>This is a **custom base images of CKAN** with specific extensions for spatial data. For the official Git Repo, please have a look: [Pre-configured CKAN Docker images](https://github.com/ckan/ckan-docker-base).

# Pre-configured CKAN Docker images

The images will usually be used as a Docker Compose install in conjunction with other Docker images that make up the CKAN platform. 

The following CKAN versions are available at this repo:

| CKAN Version | Type | Docker tag | Notes |
| --- | --- | --- | --- |
| 2.9.9 | custom image | `ghcr.io/mjanez/ckan-base-spatial:ckan-2.9.9` | Includes dependencies for spatial capabilities. Compatible with ckanext-spatial. [Changelog](https://github.com/mjanez/ckan-docker-spatial/pull/13). |
| 2.9.10 | custom image | `ghcr.io/mjanez/ckan-base-spatial:ckan-2.9.10` | Includes dependencies for spatial capabilities. Compatible with ckanext-spatial. [Changelog](https://github.com/mjanez/ckan-docker-spatial/pull/32). |
| 2.9.11 | custom image | `ghcr.io/mjanez/ckan-base-spatial:ckan-2.9.11` | Includes dependencies for spatial capabilities. Compatible with ckanext-spatial. [Changelog](https://github.com/mjanez/ckan-docker-spatial/pull/66). |
| 2.10.4 | custom image | `ghcr.io/mjanez/ckan-base-spatial:ckan-2.10.4` | Includes dependencies for spatial capabilities. Compatible with ckanext-spatial. [Changelog](https://github.com/mjanez/ckan-docker-spatial/pull/66). |
| 2.10.4 | latest custom image | `ghcr.io/mjanez/ckan-base-spatial:master` | Latest `ckan-base-spatial` image. |

> [!NOTE]
>The custom CKAN Docker installation (with spatial extensions) can be found here: [`mjanez/ckan-docker`](https://github.com/mjanez/ckan-docker)

### Building and Pushing the images

The images can be built locally and tagged appropriately so they can then be pushed into the CKAN DockerHub repo
assuming you have the correct permission to do so

For CKAN 2.9.11 base images, go to the `ckan-2.9/base` directory and use the Makefile included:

    cd ckan-2.9/base
    make build
    make push

For CKAN 2.9.11 dev images, go to the `ckan-2.9/dev` directory and use the Makefile included:

    cd ckan-2.9/dev
    make build
    make push

For CKAN 2.9.11 test images, go to the `ckan-2.9/test` directory and use the Makefile included:

    cd ckan-2.9/test
    make build
    make push

The CKAN 2.10 base and dev images are available as the dev branches at the moment

    cd ckan-2.10/base
    make build
    make push

    cd ckan-2.10/dev
    make build
    make push


### Test extensions with a test image
To test an extension against the CKAN version you want to use, proceed as follows:

1. Clone the repository, i.e. [`ckanext-schemingdcat`](https://github.com/mjanez/ckanext-schemingdcat) and navigate to the directory:
   ```shell
   git clone https://github.com/mjanez/ckanext-schemingdcat.git /path/to/your/ckan/extensions/ckanext-schemingdcat
   cd /path/to/your/ckan/extensions/ckanext-schemingdcat

2. Check that `docker/Dockerfile` contains all the steps needed for your extension, i.e: 
    ```dockerfile
    ENV CKAN_VERSION=2.9
    ENV APP_DIR=/srv/app
    ENV CKAN_DIR=${APP_DIR}/src/ckan
    ENV TZ=UTC

    WORKDIR ${APP_DIR}/src/ckanext-schemingdcat

    # Copy extension files to the container
    COPY . .

    # Install the base + test dependencies
    RUN pip install --no-cache-dir -r ${APP_DIR}/src/ckanext-schemingdcat/requirements.txt && \
        # ignore installed packaging required version (fixed pyshacl issues)
        pip install --no-cache-dir -r ${APP_DIR}/src/ckanext-schemingdcat/dev-requirements.txt && \
        pip install -e ${APP_DIR}/src/ckanext-schemingdcat && \
        # Replace default path to CKAN core config file with the one on the container
        sed -i -e 's/use = config:.*/use = config:\/srv\/app\/src\/ckan\/test-core.ini/' test.ini

    WORKDIR ${APP_DIR}

    # Setup other extensions
    RUN echo "mjanez/ckanext-dcat" && \
        pip install --no-cache-dir -e git+https://github.com/mjanez/ckanext-dcat.git#egg=ckanext-dcat && \
        pip install --no-cache-dir -r ${APP_DIR}/src/ckanext-dcat/requirements.txt && \
        echo "ckan/ckanext-harvest" && \
        pip install --no-cache-dir -e git+https://github.com/ckan/ckanext-harvest.git#egg=ckanext-harvest && \
        pip install --no-cache-dir -r ${APP_DIR}/src/ckanext-harvest/requirements.txt && \
        echo "ckan/ckanext-scheming" && \
        pip install --no-cache-dir -e git+https://github.com/ckan/ckanext-scheming.git#egg=ckanext-scheming && \
        echo "mjanez/ckanext-fluent" && \
        pip install --no-cache-dir -e git+https://github.com/mjanez/ckanext-fluent.git#egg=ckanext-fluent

    WORKDIR ${APP_DIR}/src/ckanext-schemingdcat

    # Running the tests with coverage output
    CMD ["/bin/sh", "-c", "$APP_DIR/test_ckan.sh -d ckanext/schemingdcat/tests ckanext.schemingdcat"]
    ```

3. Now, build the necessary Docker images. This step ensures that all dependencies and configurations are correctly set up.
   ```shell
   docker compose build
   ```

4. After building the images, you can run the tests. The Docker Compose configuration mounts the root of the repository into the CKAN container as a volume. This means that any changes you make to the code will be reflected inside the container without needing to rebuild the image, unless you modify the extension's dependencies.
   ```shell
   docker compose up
   ```

### Scanning the images for vulnerabilites

Using [Snyk Advisor](https://docs.docker.com/develop/scan-images/) via [Github Actions](https://github.com/snyk/actions).

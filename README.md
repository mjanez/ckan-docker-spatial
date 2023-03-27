<h1 align="center">CKAN Docker Compose - Open Data & GIS</h1>
<p align="center">
<a href="https://github.com/OpenDataGIS/ckan"><img src="https://img.shields.io/badge/Docker%20CKAN-2.9.8-brightgreen" alt="CKAN Versions"></a>


<p align="center">
    <a href="#overview">Overview</a> •
    <a href="#ckan-docker-roadmap">Branch roadmap</a> •
    <a href="#building-and-pushing-the-images">Building and Pushing the images</a> •
    <a href="#scanning-the-images-for-vulnerabilites">Scanning the images for vulnerabilites</a>
</p>

**Requirements**:
* [Docker](https://docs.docker.com/get-docker/)

## Overview
Contains CKAN spatial images for the different components of CKAN Cloud and a Docker compose environment (based on [the Git repo of the official Docker images](ttps://github.com/ckan/ckan-docker-base)) for development and testing Open Data portals.

>**Warning**:<br>
>This is a **custom base images of CKAN** with specific extensions for spatial data. For the official Git Repo, please have a look: [Pre-configured CKAN Docker images](https://github.com/ckan/ckan-docker-base).

# Pre-configured CKAN Docker images

The images will usually be used as a Docker Compose install in conjunction with other Docker images that make up the CKAN platform. 

The official CKAN Docker install is located here: [ckan-docker](https://github.com/ckan/ckan-docker)

The following CKAN versions are available in base or dev forms. They are distinguished from one another using different Docker image tags:

| CKAN Version | Type | Docker tag | Notes |
| --- | --- | --- | --- |
| 2.9.8 | custom image | `ckan/ckan-spatial:master` | Includes dependencies for spatial capabilities. Compatible with ckanext-spatial. |

### Building and Pushing the images

The images can be built locally and tagged appropriately.


### Scanning the images for vulnerabilites

<to do - provide details on the process of how we scan images - probably using [Synk Advisor](https://docs.docker.com/develop/scan-images/)>
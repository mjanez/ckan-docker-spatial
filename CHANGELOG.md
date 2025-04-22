# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

<!-- insertion marker -->
## Unreleased

<small>[Compare with latest (ckan-2.10.5)](https://github.com/mjanez/ckan-docker-spatial/compare/ckan-2.10.5...ckan-2.11)</small>

### Added

- Add .vscode/settings.json to .gitignore ([677bb91](https://github.com/mjanez/ckan-docker-spatial/commit/677bb9142f55dcc043581b7f764c4d5bc38ce898) by mjanez).
- Add steps to build, push, and lint test Docker image ([01ea06c](https://github.com/mjanez/ckan-docker-spatial/commit/01ea06cead97f2081143aee6916ea2a075f694b0) by mjanez).
- Add continue-on-error to Python Dockerfile linting step ([a26aa0c](https://github.com/mjanez/ckan-docker-spatial/commit/a26aa0c1997f6bc79f68a5524b307ad4e352defd) by mjanez).
- Add link to test extensions in README.md ([7a3a653](https://github.com/mjanez/ckan-docker-spatial/commit/7a3a653c5d70fe57de10e28e8a8aa38440ed4bab) by mjanez).
- Add info about test extensions ([411ebf7](https://github.com/mjanez/ckan-docker-spatial/commit/411ebf7f22f6cd05cb3b43a550c87e7f9e7dd62b) by mjanez).
- Add new test image ([f2099b5](https://github.com/mjanez/ckan-docker-spatial/commit/f2099b5d4c4f9897d685ec9187165f7be910e1ed) by mjanez).
- Add missing tags to README ([769e3e2](https://github.com/mjanez/ckan-docker-spatial/commit/769e3e290bf218c07c8b67947dfd50ab9ae5b216) by amercader).
- Add CHANGELOG file ([6c01835](https://github.com/mjanez/ckan-docker-spatial/commit/6c01835d913e6b180e13927226743f86af4eaf4d) by amercader).
- Add Debian-based Python images for CKAN 2.9 as well ([7ca2af3](https://github.com/mjanez/ckan-docker-spatial/commit/7ca2af3c2ba2bb7401f1e383ed36ccf1f494ab02) by amercader).
- Add CKAN 2.11 images ([8373a3c](https://github.com/mjanez/ckan-docker-spatial/commit/8373a3cdc10704faa05e99964c099f1af3f6dd7b) by amercader).
- Add ckan-2.9.10 to avalaible images ([933e18e](https://github.com/mjanez/ckan-docker-spatial/commit/933e18e0231b8f10c69aa1d68401afa57eda7965) by mjanez).
- Add condition to DOCKERFILE_PATH ([ad06ce2](https://github.com/mjanez/ckan-docker-spatial/commit/ad06ce248dd1081d5b6f745667890cb3c7655804) by mjanez).
- Add dcron package to Dockerfile ([8db56b8](https://github.com/mjanez/ckan-docker-spatial/commit/8db56b8e9816276cafaf746d41b2991bdf30778b) by mjanez).
- Add Github Action to build the master image daily ([78fa5d3](https://github.com/mjanez/ckan-docker-spatial/commit/78fa5d306cd24cda63cfea3172b7d02cf44c33a5) by amercader).
- Add images to build the lastest CKAN master branch ([9a3926d](https://github.com/mjanez/ckan-docker-spatial/commit/9a3926d90bf24c73713a2030c257cd8e384ebd8c) by amercader).
- Add workaround for pyyaml/cython requirements issue ([a444fc4](https://github.com/mjanez/ckan-docker-spatial/commit/a444fc40d0b0011364e84f1ce00e3f855d8ba81b) by amercader).
- Add changes to 2.9, remove from dev ([9bcd65e](https://github.com/mjanez/ckan-docker-spatial/commit/9bcd65ee7c1eaf4eb2944c9a9f6322bebd455654) by amercader).
- Add missing cert/key files ([71bdf09](https://github.com/mjanez/ckan-docker-spatial/commit/71bdf09e5b54a77c961a3cff9e22b0e74e7aef66) by amercader).
- Add tags to docker.yml actions ([5f4f2b9](https://github.com/mjanez/ckan-docker-spatial/commit/5f4f2b9fe003d11e478613a90d1f574d82112a8e) by mjanez).
- Add .gitignore ([5edd88e](https://github.com/mjanez/ckan-docker-spatial/commit/5edd88e241e6d7f6fdd4762fe4fa5a326f990bdd) by Brett).
- Add DataPusher ([8282173](https://github.com/mjanez/ckan-docker-spatial/commit/82821733cfd4048db268cc652075a062d7b808cf) by Brett).
- Add master ([a9d87c5](https://github.com/mjanez/ckan-docker-spatial/commit/a9d87c599484ebc14b959d8be3013dd7279dfd04) by Brett).
- Add the dev stuff ([a64077c](https://github.com/mjanez/ckan-docker-spatial/commit/a64077c3a2e98e1821cd39bc73b962704f79c1b2) by Brett).

### Fixed

- Fix PYTHON_DOCKERFILE assign ([fdeae2e](https://github.com/mjanez/ckan-docker-spatial/commit/fdeae2e42d7e8c2d6e71d71e3efc49495dfbd2d3) by mjanez).
- Fix unnecesary GIT_BRANCH env in 2.9-dev ([46fd45f](https://github.com/mjanez/ckan-docker-spatial/commit/46fd45f3623e0fdc59175d940493f1c7d867e926) by mjanez).
- FIx WORKDIRs instead of cd in Dockerfiles ([a0b37f2](https://github.com/mjanez/ckan-docker-spatial/commit/a0b37f2ebf477aab70d704355f873ffb1e75fd72) by mjanez).
- Fix REPO_BRANCH in test Dockerfile ([3548fa7](https://github.com/mjanez/ckan-docker-spatial/commit/3548fa77e58386cd33fa3f674d8a5036881e844a) by mjanez).
- Fix Dockerfiles 2.10 to using CKAN_VERSION ([e71e646](https://github.com/mjanez/ckan-docker-spatial/commit/e71e646e05c5f3a266b456a00d5a57862093e6ec) by mjanez).
- FIx image names ([baf940c](https://github.com/mjanez/ckan-docker-spatial/commit/baf940c444b63f050ae548e20998272eca9667fe) by mjanez).
- Fix tagging for Python files ([242346e](https://github.com/mjanez/ckan-docker-spatial/commit/242346e65cb679bca87f6fd6ecd298b1b67aab34) by mjanez).
- Fix Dockerfile determination to use only the filename ([5e13e7f](https://github.com/mjanez/ckan-docker-spatial/commit/5e13e7f79fc6c4d80dc3ae65fe0883dba6d9e410) by mjanez).
- Fix Dockerfile for >2.9.11 backports ([a964d6a](https://github.com/mjanez/ckan-docker-spatial/commit/a964d6ae434198f44b38deb74f2088cc2f6ee9d9) by mjanez).
- Fix image tag ([2ed6bb2](https://github.com/mjanez/ckan-docker-spatial/commit/2ed6bb2c0a94bcfda40d799147e02704f70f2070) by mjanez).
- Fix ckan_version in jobs ([3dce461](https://github.com/mjanez/ckan-docker-spatial/commit/3dce461bfea76a0911859c0403cdd33a51c23532) by mjanez).
- Fix BRANCH ([7f91568](https://github.com/mjanez/ckan-docker-spatial/commit/7f915683533a0393733020f219250e8b0d14cbcf) by mjanez).
- Fix new workflows ([a9efedd](https://github.com/mjanez/ckan-docker-spatial/commit/a9efedd14dbe97403a7f5baa309ad8c89025c4e8) by mjanez).
- Fix pip3 for pip installation and update pip3 to the latest version ([fe98582](https://github.com/mjanez/ckan-docker-spatial/commit/fe985828894785622c9169e5a5a25ccf6ea3ab13) by mjanez).
- Fix pip instead of pip3 for pip installation ([1157265](https://github.com/mjanez/ckan-docker-spatial/commit/1157265347f569b4f6e06519c2a301c1e39baace) by mjanez).
- Fix debian packages ([b1eecfd](https://github.com/mjanez/ckan-docker-spatial/commit/b1eecfde33ac242c50f2abccad81a8aee139beb5) by mjanez).
- Fix nested subfolders ([bbf3a68](https://github.com/mjanez/ckan-docker-spatial/commit/bbf3a68fbdb4dff49a4f58b79f35d72be01f047e) by mjanez).
- Fix 2.11 dev base image ([b69d2fd](https://github.com/mjanez/ckan-docker-spatial/commit/b69d2fdd70016627fad6bcbb43f1dec255caf0de) by amercader).
- Fix tag name ([d2c8517](https://github.com/mjanez/ckan-docker-spatial/commit/d2c851730aade4a9b5998689b3b2b5d105e7a5f4) by amercader).
- Fix warning ([29ac241](https://github.com/mjanez/ckan-docker-spatial/commit/29ac2414e038e768eae7781fbf12566cd44e4923) by amercader).
- Fix check in prerun script, cleanups ([260271d](https://github.com/mjanez/ckan-docker-spatial/commit/260271d29eaaf428576a2c07dde14634a497f524) by amercader).
- Fixes master ([ed4d626](https://github.com/mjanez/ckan-docker-spatial/commit/ed4d626939fb17266230db4ee830414e4b5f1694) by amercader).
- Fix tags ([9cb0c89](https://github.com/mjanez/ckan-docker-spatial/commit/9cb0c895a88d3e31a18fca4f9ecbbddd70db18c6) by amercader).
- Fix paths and syntax ([29f6757](https://github.com/mjanez/ckan-docker-spatial/commit/29f67571e02c6daf87342d53f7a705031636538a) by amercader).
- fix for master packaging uninstall error ([d8fa932](https://github.com/mjanez/ckan-docker-spatial/commit/d8fa9324d9b8dfdef034cf5815ba46ef43fc9dd4) by Ian Ward).
- Fix manual action ([948f4e5](https://github.com/mjanez/ckan-docker-spatial/commit/948f4e50faa96abc43ca857fe1543a71ac9caa3b) by mjanez).
- Fix DOCKERFILE_PATH ([1b41cb4](https://github.com/mjanez/ckan-docker-spatial/commit/1b41cb41ac21eb08e69302c9b15cf69b92966e29) by mjanez).
- Fix Dockerfile packages install ([98a2874](https://github.com/mjanez/ckan-docker-spatial/commit/98a2874f2e291797c50dce218aec119a9b74b997) by mjanez).
- Fix formatting of warning and note in README.md ([5f646cd](https://github.com/mjanez/ckan-docker-spatial/commit/5f646cde46c9ab6d14e990104d655d383cea59f5) by mjanez).
- Fix docker-build to master branch ([dcab444](https://github.com/mjanez/ckan-docker-spatial/commit/dcab444e28182f9af6a289fd0ce5fc411fc7d9a9) by mjanez).
- Fix hadolint ([d8aa4f7](https://github.com/mjanez/ckan-docker-spatial/commit/d8aa4f70ca483ecabfbb8b964ab3164ea62068d7) by mjanez).
- Fix actions dockerfile path ([f790b21](https://github.com/mjanez/ckan-docker-spatial/commit/f790b21934a5b7d84eead12da61025e546f25018) by mjanez).
- Fix package install ([70e3f72](https://github.com/mjanez/ckan-docker-spatial/commit/70e3f724b4dfebb5ba95c37a994b8bfa702033c4) by mjanez).
- fix alpha order ([6d8bdd2](https://github.com/mjanez/ckan-docker-spatial/commit/6d8bdd2ef1b3af23971bd507d719bbd791c5ac38) by avdata99).
- Fix start_ckan_development.sh ([82a7dc8](https://github.com/mjanez/ckan-docker-spatial/commit/82a7dc8d6fdc17040d8fa62e977ed299238b39f1) by iperezx).
- Fix image tags in README ([2bf7488](https://github.com/mjanez/ckan-docker-spatial/commit/2bf748879213b29214e715ed7748e738f965c5ff) by amercader).
- Fix rm cache ([efd2ffd](https://github.com/mjanez/ckan-docker-spatial/commit/efd2ffd2a76f18f809bd2252725f98777a8c6df7) by mjanez).
- FIX pyyaml <6.0.0 ([7ded313](https://github.com/mjanez/ckan-docker-spatial/commit/7ded313ac14ce6399f7eb7dc0e65e95780c437c3) by mjanez).
- Fix image/CKAN requirements/proj <9.0.0 errors ([ac3edba](https://github.com/mjanez/ckan-docker-spatial/commit/ac3edba8db9f66e6718581e8b8de37697795ffe9) by mjanez).
- Fix doc ([1095bd6](https://github.com/mjanez/ckan-docker-spatial/commit/1095bd699ee450366169f34dc5ff07faed7cdfb3) by mjanez).
- Fix actions ([66beae5](https://github.com/mjanez/ckan-docker-spatial/commit/66beae51d1c11192899c53956fbcff4210a218ca) by mjanez).
- Fix images and actions ([bad449e](https://github.com/mjanez/ckan-docker-spatial/commit/bad449e7630d94c1030815fcd40869d6f0722795) by mjanez).
- Fix development mode ([0250658](https://github.com/mjanez/ckan-docker-spatial/commit/025065814443623c75a62f92af457b9dd332a2c2) by mjanez).
- Fix CMD ([8ff75e9](https://github.com/mjanez/ckan-docker-spatial/commit/8ff75e9d547b2bba1f216111dcc1934a579a9228) by mjanez).
- Fix Dockerfile & add sed ([8ad76a9](https://github.com/mjanez/ckan-docker-spatial/commit/8ad76a90ba0430930e451491b366fa3539588436) by mjanez).
- Fix Docker tag ([4fe31cf](https://github.com/mjanez/ckan-docker-spatial/commit/4fe31cf7d01d64d4a10685a5c9d4b50c65b31cd3) by mjanez).

### Removed

- Remove py3-gevent to avoid bugs with packaging>21.3 ([6636266](https://github.com/mjanez/ckan-docker-spatial/commit/6636266a66a2427cc82f6b6b1255ca5915cd80e0) by mjanez).
- Remove who.ini >ckan-2.11.0 ([16c251d](https://github.com/mjanez/ckan-docker-spatial/commit/16c251d47c35c1e26e871fcdef04c7e9e864fe4d) by mjanez).
- Remove datastore set permissions, unnecesary ckan-postgres-dev ([ae9558e](https://github.com/mjanez/ckan-docker-spatial/commit/ae9558ecd97e0a1c317c8abd33b29462bcfcbfb4) by mjanez).
- Remove gevent system packages ([ffa9b2a](https://github.com/mjanez/ckan-docker-spatial/commit/ffa9b2a09f2a406bf38ca8afa2303bd04a51f8be) by amercader).
- Remove venv and change filenames to align with tag names ([68ab9ee](https://github.com/mjanez/ckan-docker-spatial/commit/68ab9ee643f18d8d44899ea2597f22bc71349d29) by Brett).
- Remove solr image ([6c2da50](https://github.com/mjanez/ckan-docker-spatial/commit/6c2da50614333d932e2967af58ff35b95f818580) by mjanez).
- Remove datapusher ([861b086](https://github.com/mjanez/ckan-docker-spatial/commit/861b08699e65f8cac75d9d8520721f89a58b29ab) by mjanez).
- Remove docker.yml ([a3a6504](https://github.com/mjanez/ckan-docker-spatial/commit/a3a650416328ffce5ad684ed6de8e34bc8f111c4) by mjanez).

<!-- insertion marker -->

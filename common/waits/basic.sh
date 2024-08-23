#!/bin/bash
set -e

# Start necessary services
bash "${BASH_SOURCE%/*}/services/postgresql.sh"
bash "${BASH_SOURCE%/*}/services/solr.sh"
bash "${BASH_SOURCE%/*}/services/redis.sh"

echo "[ckan-test.basic] All services up, running command"

# Invoke run-tests.sh from /scripts directory
bash "${BASH_SOURCE%/*}/../scripts/run-tests.sh" "$@"
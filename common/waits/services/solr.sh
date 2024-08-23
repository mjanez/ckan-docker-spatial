#!/bin/bash
set -e

echo "[ckan-test.services.solr] Wait for Solr to start..."
while ! curl -s "http://solr:8983/solr/ckan/admin/ping" | grep -q OK; do
  sleep 1;
done
echo "[ckan-test.services.solr] Solr started"

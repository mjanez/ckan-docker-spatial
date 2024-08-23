#!/bin/bash
set -e

echo "[ckan-test.solr] Wait for Solr to start..."
while ! curl -s "http://solr:8983/solr/ckan/admin/ping" | grep -q OK; do
  sleep 1;
done
echo "[ckan-test.solr] Solr started"

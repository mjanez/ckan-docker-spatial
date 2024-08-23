#!/bin/bash
set -e

echo "[ckan-test.services.elasticsearch] Wait for Elasticsearch to start..."
while ! curl -s "http://elasticsearch:9200/_cluster/health" | grep -q green; do
  sleep 1;
done
echo "[ckan-test.services.elasticsearch] Elasticsearch started"

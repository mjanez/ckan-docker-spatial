#!/bin/bash
set -e

echo "[ckan-test.services.mongodb] Wait for MongoDB to start..."
while ! nc -z mongodb 27017; do
  sleep 1;
done
echo "[ckan-test.services.mongodb] MongoDB started"

#!/bin/bash
set -e

echo "[ckan-test.services.postgresql] Wait for PostgreSQL to start..."
while ! pg_isready -h db -U ckan_default; do
    sleep 1;
done
echo "[ckan-test.services.postgresql] PostgreSQL started"

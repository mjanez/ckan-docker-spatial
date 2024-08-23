#!/bin/bash
set -e

echo "Wait for PostgreSQL to start..."
while ! pg_isready -h db -U ckan_default; do
    sleep 1;
done
echo "PostgreSQL started"

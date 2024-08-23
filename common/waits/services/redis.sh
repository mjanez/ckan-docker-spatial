#!/bin/bash
set -e

echo "[ckan-test.services.redis] Wait for Redis to start..."
while ! echo -e "PING" | nc -w 1 redis 6379 | grep -q "+PONG"; do
  sleep 1;
done
echo "[ckan-test.services.redis] Redis started"

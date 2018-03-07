#!/bin/bash

set -e
sleep 10
exec /usr/local/bin/docker-entrypoint.sh rabbitmq-server

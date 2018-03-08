#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COUNT=0;
set -e
while [ ! -f ${DIR}/.configured ]; then
        echo "Not configured already"
	if [ ${COUNT} -gt 10 ]; then
		echo "After 10 seconds, confd has not configured rabbitmq, continue as default"
		break;
	fi
	sleep 1
	COUNT=$(( $COUNT + 1 ))
done
exec /usr/local/bin/docker-entrypoint.sh rabbitmq-server

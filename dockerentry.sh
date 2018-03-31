#!/bin/sh

cp /run.sh /opt/rancher/bin/
chmod +x /opt/rancher/bin/run.sh


if [[ -v ALTERNATE_CONF ]]; then 
    echo "Custom template found: overriding internal template";
    printenv ALTERNATE_CONF > /etc/confd/templates/rabbitmq.tmpl; 
fi
exec /confd $@ $CONFD_ARGS -onetime
touch /opt/rancher/bin/.configured
exec /confd $@ $CONFD_ARGS

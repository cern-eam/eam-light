#!/bin/sh

# Start Nginx in the background
nginx -g "daemon off;" &

# Start WildFly
/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0
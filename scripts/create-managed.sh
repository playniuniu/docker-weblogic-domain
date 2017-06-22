#!/bin/bash

# Wait for AdminServer to become available 
/home/oracle/bin/wait-admin-server.sh

# Add ManagedServer to the AdminServer only if first execution
if [ ! -f .create-managed.flag ]; then
    wlst.sh -skipWLSModuleScanning /home/oracle/bin/create-managed.py
    touch .create-managed.flag
fi

${DOMAIN_HOME}/bin/startManagedWebLogic.sh ${MS_NAME:-ManagedServer} http://${ADMIN_HOST}:${ADMIN_PORT}/

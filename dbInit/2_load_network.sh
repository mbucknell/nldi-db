#!/bin/bash

# Restart postgres to make sure we can connect
pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart

gunzip -c ${LIQUIBASE_HOME}/nhdplus.yahara.pgdump.gz | pg_restore -h 127.0.0.1 -p 5432 -U postgres -w -a -d nldi
gunzip -c ${LIQUIBASE_HOME}/characteristic_data.yahara.pgdump.gz | pg_restore -h 127.0.0.1 -p 5432 -U postgres -w -a -d nldi -n characteristic_data

#!/bin/bash 

# Restart postgres to make sure we can connect
pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart

gunzip -c ${LIQUIBASE_HOME}/nldi_data.crawler_source.pgdump.gz | pg_restore -h 127.0.0.1 -p 5432 -U nldi -w -a -d nldi
gunzip -c ${LIQUIBASE_HOME}/feature_wqp_yahara.backup.gz | pg_restore -h 127.0.0.1 -p 5432 -U nldi -w -a -d nldi
gunzip -c ${LIQUIBASE_HOME}/feature_huc12pp_yahara.backup.gz | pg_restore -h 127.0.0.1 -p 5432 -U nldi -w -a -d nldi
gunzip -c ${LIQUIBASE_HOME}/feature_np21_nwis_yahara.backup.gz | pg_restore -h 127.0.0.1 -p 5432 -U nldi -w -a -d nldi

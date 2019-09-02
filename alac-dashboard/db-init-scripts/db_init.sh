#!/bin/sh
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE "${POSTGRES_DATABASE}_testing";
    GRANT ALL PRIVILEGES ON DATABASE "${POSTGRES_DATABASE}_testing" TO $POSTGRES_USER;
EOSQL
exit

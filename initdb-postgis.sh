#!/bin/bash

set -e

# Load PostGIS into $POSTGRES_DB
echo "Loading PostGIS extensions into ${POSTGRES_DB}"
"${psql[@]}" --dbname="${POSTGRES_DB}" --user="${POSTGRES_USER}" <<- 'EOSQL'
    CREATE EXTENSION IF NOT EXISTS postgis;
    CREATE EXTENSION IF NOT EXISTS postgis_topology;
    CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
    CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

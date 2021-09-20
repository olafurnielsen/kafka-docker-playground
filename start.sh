#!/bin/bash

# Create data directories for service volumes if not present
# These directories are used for data persistance
declare -a DATA_DIRS=(
  './data/service-volumes/.zookeeper-data'
  './data/service-volumes/.zookeeper-tx-logs'
  './data/service-volumes/.kafka-data'
  './data/service-volumes/.mysql-data'
  './data/service-volumes/.postgres-data'
)

for DIR in ${DATA_DIRS[*]}
do
  if [ ! -d "${DIR}" ]
  then
    echo "Creating ${DIR}"
    mkdir -p $DIR
    chown -R 1000:1000 $DIR
  fi
done

docker-compose \
  -f services/docker-compose.zookeeper.yml \
  -f services/docker-compose.broker.yml \
  -f services/docker-compose.schema-registry.yml \
  -f services/docker-compose.kafka-connect.yml \
  -f services/docker-compose.ksqldb.yml \
  -f services/docker-compose.control-center.yml \
  -f services/docker-compose.mysql.yml \
  -f services/docker-compose.postgres.yml \
  -f services/docker-compose.elasticsearch.yml \
  -f services/docker-compose.kibana.yml \
  -f services/docker-compose.neo4j.yml \
  up -d
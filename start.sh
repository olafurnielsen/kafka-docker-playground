#!/bin/bash

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
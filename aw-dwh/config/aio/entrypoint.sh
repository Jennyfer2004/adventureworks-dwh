#!/bin/bash

export DAGSTER_DIR=/var/lib/adventureworks/dagster
export DAGSTER_HOM=/opt/dagster
export SPARK_DIR=/opt/spark


# cd ${DAGSTER_DIR} && dagster-webserver -h 0.0.0.0 -p 3070 &

cd ${DAGSTER_DIR} && dagster dev -p 3070 -h 0.0.0.0 &

cd ${SPARK_DIR}

start-master.sh -p 7077
start-worker.sh spark://spark-iceberg:7077
start-history-server.sh
start-thriftserver.sh  --driver-java-options "-Dderby.system.home=/tmp/derby"

# Entrypoint, for example notebook, pyspark or spark-sql
if [[ $# -gt 0 ]] ; then
    eval "$1"
fi




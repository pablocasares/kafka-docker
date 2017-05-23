# kubernetes-kafka
Apache Kafka to Kubernetes Statefulset

Example of deploy cluster to kubernetes.

## Features
* Support scaling
* Auto rebalancing on expanding cluster

## kafka-kubernetes-start.sh
This script starts kafka at each pod. It is called by the statefulset Kafka file. The most relevant part for developers is:

`HOST=`hostname -s`

if [[ $HOST =~ (.*)-([0-9]+)$ ]]; then
	NAME=${BASH_REMATCH[1]}
	ORD=${BASH_REMATCH[2]}
        export KAFKA_BROKER_ID=$ORD
else
	echo "Failed to extract ordinal from hostname $HOST"
	exit 1
fi`

This code sets the Kafka broker ID extracting the value from the pod hostname. The pod hostname is setted by Kubernetes statefulset deploy. Kubernetes knows when a concrete pod is died and, in that case, it will deploy another pod with the same hostname. This is the key for using the integer part of the hostname as the Kafka broker ID.



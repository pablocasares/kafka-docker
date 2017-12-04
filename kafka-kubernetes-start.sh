#!/usr/bin/env bash


if [[ -z "${KAFKA_ADVERTISED_HOST_NAME// }" ]] ; then
	echo "KAFKA_ADVERTISED_HOST_NAME NOT DEFINED OR INVALID '$KAFKA_ADVERTISED_HOST_NAME' !!!"
	exit 1
fi

HOST=`hostname -s`

if [[ $HOST =~ (.*)-([0-9]+)$ ]]; then
	NAME=${BASH_REMATCH[1]}
	ORD=${BASH_REMATCH[2]}
        export KAFKA_BROKER_ID=$ORD
else
	echo "Failed to extract ordinal from hostname $HOST"
	exit 1
fi


if [[ -z "$KAFKA_BROKER_ID" ]]; then
	echo "Got empty broker ID from hostname; not starting!"
	exit 1
fi

export JMX_PORT=$KAFKA_JMX_PORT

/usr/bin/start-kafka.sh

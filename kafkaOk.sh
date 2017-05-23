KAFKA_CHECK_PORT=${KAFKA_PORT:-9092}
nc -z 127.0.0.1 $KAFKA_CHECK_PORT
OK=$?
if [ $OK == 0 ]; then
        exit 0
else
        exit 1
fi

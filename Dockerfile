FROM wurstmeister/kafka:0.10.2.0

MAINTAINER wizzie.io

RUN java -version

ADD . /tmp/build
RUN cd /tmp/build && \
    ./gradlew -Dorg.gradle.native=false build && \
    cp build/libs/kubernetes-expander-1.0-SNAPSHOT.jar $KAFKA_HOME/libs/

ADD kafka-autoextend-partitions.sh /usr/bin/kafka-autoextend-partitions.sh
ADD kafka-kubernetes-start.sh /usr/bin/kafka-kubernetes-start.sh
ADD kafkaOk.sh /usr/bin/kafkaOk.sh

# CMD ["kafka-kubernetes-start.sh"]

FROM wurstmeister/kafka:1.0.0

MAINTAINER wizzie.io

RUN java -version

ADD kafka-kubernetes-start.sh /usr/bin/kafka-kubernetes-start.sh
ADD kafkaOk.sh /usr/bin/kafkaOk.sh

# CMD ["kafka-kubernetes-start.sh"]

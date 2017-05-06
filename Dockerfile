FROM alpine:edge

MAINTAINER <smapira@routeflags.com>

# Update Alpine environment
RUN apk add --update --no-cache ca-certificates openjdk8 python

## Install Cassandra
RUN wget -O - 'http://apache.cs.utah.edu/cassandra/3.10/apache-cassandra-3.10-bin.tar.gz' | tar zxvf -
RUN mv apache-cassandra-3.10 /root/cassandra
RUN mkdir /var/lib/cassandra /var/log/cassandra

## Establish Cassandra Environmental Variables
ENV CASSANDRA_VERSION 3.10
ENV CASSANDRA_HOME /root/cassandra
ENV PATH $PATH:/root/cassandra/bin

EXPOSE 9042

CMD [ "cassandra", "-Rf" ]

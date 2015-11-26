FROM postgres:9.3
MAINTAINER roberto.w.filho@gmail.com

ADD ./trackr.tar.gz /tmp/trackr.tar.gz
USER postgres

RUN tar -xvf /tmp/trackr.tar.gz --directory /tmp
RUN psql -U postgres -d postgres -c "DROP DATABASE trackr" && \
    psql -U postgres -d postgres -c "CREATE DATABASE trackr" && \
    psql -d trackr -U postgres -f /tmp/trackr.sql

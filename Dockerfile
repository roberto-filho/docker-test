FROM postgres:9.3
MAINTAINER roberto.w.filho@gmail.com

# Instala o contrib package, para usar o unaccent
RUN apt-get -qq update
RUN apt-get -qq -y install postgresql-contrib

# Tell debconf that it is working in non interactive environment
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Copia o arquivo (e já extrai ele)
ADD ./trackr.tar.gz /tmp/
COPY docker-entrypoint.sh /
RUN chmod +rx /docker-entrypoint.sh

USER postgres

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["trackr", "/tmp/trackr.sql"]

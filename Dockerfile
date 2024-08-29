FROM ubuntu:22.04

 

# Ports

EXPOSE 7473

EXPOSE 7687

 

# Environment variables to override neo4j.conf

ENV NEO4J_dbms_ssl_policy_https_enabled true

ENV NEO4J_dbms_ssl_policy_https_enabled true

ENV NEO4J_dbms_ssl_policy_https_base__directory /ssl/https

ENV NEO4J_dbms_ssl_policy_https_private__key private.key

ENV NEO4J_dbms_ssl_policy_https_public__certificate public.crt

ENV NEO4J_dbms_ssl_policy_bolt_enabled true

ENV NEO4J_dbms_ssl_policy_bolt_enabled true

ENV NEO4J_dbms_ssl_policy_bolt_base__directory /ssl/bolt

ENV NEO4J_dbms_ssl_policy_bolt_private__key private.key

ENV NEO4J_dbms_ssl_policy_bolt_public__certificate public.crt

ENV NEO4J_server_bolt_enabled true

ENV NEO4J_server_bolt_tls__level REQUIRED

ENV NEO4J_server_bolt_listen__address 0.0.0.0:7687

ENV NEO4J_server_http_enabled false

ENV NEO4J_server_https_enabled true

ENV NEO4J_server_https_listen__address 0.0.0.0:7473

 

# Set the location for the container where all

# custom scripts will be placed

WORKDIR /docker

 

COPY repo.sh ./repo.sh

 

RUN apt update

RUN apt install wget -y

 

# Add the neo4j package repository so we can install neo4j

RUN chmod +x repo.sh

RUN ./repo.sh

 

RUN apt update

 

# Now that we have the repo, install neo4j

RUN apt install neo4j=1:5.21.0 -y

 

ENTRYPOINT ["/bin/bash"]
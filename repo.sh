apt-key advc --keyserver debian.neo4j.com --recv-keys 59D700E4D37F5F19
echo 'deb http://debian.neo4j.com stable 5' | tee -a /etc/apt/sources.list.d/neo4j.list

apt-get update
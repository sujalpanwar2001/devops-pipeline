FROM tomcat:9
EXPOSE 9999
COPY target/dummyproject-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/dummyproject-1.0-SNAPSHOT.war
CMD ["catalina.sh","run"]
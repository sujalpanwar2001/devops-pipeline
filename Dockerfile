FROM tomcat:9
EXPOSE 8080
COPY target/dummyproject-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/dummyproject-1.0-SNAPSHOT.war
CMD ["catalina.sh","run"]

FROM tomcat:9
EXPOSE 8080
COPY target/dummyproject.war /usr/local/tomcat/webapps/dummyproject.war
CMD ["catalina.sh","run"]

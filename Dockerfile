FROM tomcat:8.0-alpine
COPY target/gamutkart.war /usr/local/tomcat/webapps/


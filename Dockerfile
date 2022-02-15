FROM tomcat:8-jdk8
MAINTAINER DEVOPSEASY
ADD ./gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

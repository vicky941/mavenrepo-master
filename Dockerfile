FROM tomcat:9
WORKDIR /root/maven-master
COPY *.war /usr/share/tomcat/webapps/studentapp.war
COPY . .
CMD ["catalina.sh","run"]

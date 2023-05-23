FROM tomcat:9
WORKDIR /root/maven-master
COPY *.war /usr/share/tomcat/webapps
COPY . .
CMD ["catalina.sh","run"]

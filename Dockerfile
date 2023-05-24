FROM tomcat:9
RUN apt-get update && apt-get install -y wget
RUN rm -rf /usr/local/tomcat/webapps/*
# Download the .war file from Nexus using wget and save as ROOT.war
RUN wget -O /usr/local/tomcat/webapps/ROOT.war http://3.109.207.222:8081/repository/myapp/com/exam/studentapp/1/studentapp-1.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

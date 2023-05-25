FROM tomcat:9
# Download the .war file from Nexus using wget and save as ROOT.war
RUN wget -O /usr/local/tomcat/webapps/ROOT.war http://18.177.136.26:8081/repository/studentapp-snap/com/jdevs/studentapp/2.5-SNAPSHOT/studentapp-2.5.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

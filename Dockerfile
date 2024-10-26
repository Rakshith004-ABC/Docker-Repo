# Base image
FROM tomcat:9.0-jdk11

# Update the package repository
RUN apt-get update -y

# Install wget (in case it's not already installed)
RUN apt-get install wget -y

# Download Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz

# Extract the downloaded tar.gz file
RUN tar -xvzf apache-tomcat-9.0.54.tar.gz

# Set the working directory
WORKDIR /usr/local/tomcat

# Copy the Amazon.war file to the webapps directory
COPY Amazon.war /usr/local/tomcat/webapps/

# Expose port 8094
EXPOSE 8094

# Set the entry point to run Tomcat
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/catalina.sh", "run"]

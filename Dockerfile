
# Maven build container

FROM openjdk

COPY pom.xml /tmp/
COPY mvnw /tmp/
COPY hello-world-starter/ /tmp/hello-world-starter
COPY hello-world-app/ /tmp/hello-world-app
COPY mvnw.cmd /tmp
COPY .mvn/ /tmp/.mvn
WORKDIR /tmp/

RUN ./mvnw clean install

#pull base image

FROM openjdk

#maintainer
LABEL MAINTAINER tkyls
#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /tmp/target/hello-world-0.1.0.-SNAPSHOT.jar 
#copy hello world to docker image from builder image


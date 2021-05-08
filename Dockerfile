FROM openjdk

COPY pom.xml /app/
COPY mvnw /app/
COPY hello-world-starter/ /app/hello-world-starter
COPY hello-world-app/ /app/hello-world-app
COPY mvnw.cmd /app
COPY .mvn/ /app/.mvn

WORKDIR /app/

RUN ./mvnw clean install

#pull base image

#maintainer
LABEL MAINTAINER tkyls
#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /app/hello-world-app/target/hello-world-app-0.0.1-SNAPSHOT.jar
#copy hello world to docker image from builder image


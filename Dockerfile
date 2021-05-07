
# Maven build container

FROM maven:3.6.3-openjdk-11 AS maven_build

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
CMD java -jar hello-world-app/src/main/hello-world-app-0.0.1-SNAPSHOT.jar

#copy hello world to docker image from builder image

COPY --from=maven_build /tmp/target/hello-world-0.1.0.-SNAPSHOT.jar /data/hello-world-0.1.0.jar


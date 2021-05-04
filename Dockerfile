# Maven build container 

FROM maven:3.6.3-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN ./mvnw clean install

#pull base image

FROM openjdk

#maintainer 
MAINTAINER ynusyalcn@gmail.com
#expose port 8080
EXPOSE 8080

#default command
CMD java -jar hello-world-app/target/hello-world-app-0.0.1-SNAPSHOT.jar

#copy hello world to docker image from builder image

COPY --from=maven_build /tmp/target/hello-world-0.1.0.-SNAPSHOT.jar /data/hello-world-0.1.0.jar

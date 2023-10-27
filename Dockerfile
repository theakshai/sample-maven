# Stage 1: Build the JAR file using Maven
FROM maven AS builder

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mvn package

RUN mkdir -p /usr/src/app/targets

RUN mv /usr/src/app/target/sample-maven-0.0.1-SNAPSHOT.jar /usr/src/app/targets/sample-maven-0.0.1-SNAPSHOT.jar


FROM openjdk:17-oracle

WORKDIR /opt/app


COPY --from=builder /usr/src/app/targets/sample-maven-0.0.1-SNAPSHOT.jar /opt/app/sample-maven-0.0.1-SNAPSHOT.jar

EXPOSE 4000

CMD ["java", "-jar", "sample-maven-0.0.1-SNAPSHOT.jar"] 

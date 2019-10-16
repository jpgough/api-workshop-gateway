FROM gradle:jdk11 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM adoptopenjdk:11-jre-hotspot
RUN mkdir /opt/app
COPY --from=builder /home/gradle/src/build/libs/gateway-0.0.1-SNAPSHOT.jar /opt/app/app.jar
EXPOSE 8081
ENTRYPOINT [ "java", "-jar", "/opt/app/app.jar" ]
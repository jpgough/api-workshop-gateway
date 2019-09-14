FROM adoptopenjdk:12-jre-hotspot
RUN mkdir /opt/app
ADD build/libs/gateway-0.0.1-SNAPSHOT.jar /opt/app/app.jar
EXPOSE 8081
ENTRYPOINT [ "java", "-jar", "/opt/app/app.jar" ]
FROM openjdk:11
VOLUME /tmp
ADD build/libs/gateway-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
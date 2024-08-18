FROM openjdk:17-jdk-slim
WORKDIR /app

COPY target/version-app-0.0.1-SNAPSHOT.jar /app/version-app.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/version-app.jar"]

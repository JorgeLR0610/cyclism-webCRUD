# noble stands for Noble Numbat (Ubuntu 24.04)
FROM eclipse-temurin:21-jdk-noble

# Temp var (build argument) that points to the .jar
ARG JAR_FILE=target/*.jar

# Copies the .jar into the container as app.jar
COPY ${JAR_FILE} app.jar

# This'll be executed once the container starts (basically java -jar app.jar)
ENTRYPOINT [ "java", "-jar", "app.jar" ]
# Build stage
# noble stands for Noble Numbat (Ubuntu 24.04)
FROM eclipse-temurin:21-jdk-noble as build
# Copies all files from the repo into docker's temp filesystem
COPY . .
RUN chmod +x mvnw
# Generat the jar
RUN ./mvnw clean package -DskipTests 

# Execution stage
FROM eclipse-temurin:21-jdk-noble
COPY --from=build /target/*.jar app.jar
# This'll be executed once the container starts (basically java -jar app.jar)
ENTRYPOINT [ "java", "-jar", "app.jar" ]
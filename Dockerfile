FROM maven:3.8-openjdk-11 as build
WORKDIR /app
COPY . .
RUN mvn install

# Inject the JAR file into a new container to keep the file small
FROM openjdk:8-jdk-alpine
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY --from=build /app/target/test.prac*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]

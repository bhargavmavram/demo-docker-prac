FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} test.prac-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/test.prac-0.0.1-SNAPSHOT.jar"]

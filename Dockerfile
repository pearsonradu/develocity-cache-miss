FROM maven:3.8-eclipse-temurin-17-focal

ENV MAVEN_CONFIG=""

COPY ./ ./
RUN ./mvnw clean test -Dorg.slf4j.simpleLogger.log.gradle.goal.cache=debug

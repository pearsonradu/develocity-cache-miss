# Develocity 

## Failsafe Jacoco Cache Miss

This project demonstrates that Develocity always results in a cache miss during `failsafe:integration-test` when running with Jacoco in a `report-aggreate` mode.

### Problem 1: Failsafe Jacoco Miss

To demonstrate the following can be done:

1. Update [gradle-enterprise.xml](.mvn/gradle-enterprise.xml) and set the URL and any other necessary properties for the Develocity server
2. Run `./mvnw clean verify`
   1. This allows the initial cache to be built
3. Run `./mvnw clean verify` again
   1. `failsafe:integration-test` will result in a cache miss for the [develocity-cache-miss-failsafe-jacoco-app](develocity-cache-miss-failsafe-jacoco-app) module

#### Solution

Add `prepare-agent-integration` goal to `jacoco-maven-plugin`.

### Problem 2: Surefire Container Miss

To demonstrate the following can be done:

1. Update [gradle-enterprise.xml](.mvn/gradle-enterprise.xml) and set the URL and any other necessary properties for the Develocity server
2. Run `./mvnw clean test`
   1. This allows the initial cache to be built
3. Run `./mvnw clean test` again
   1. This should result in a complete build being cached
4. Run `docker build -t surefire-container-miss . && docker run surefire-container-miss`
   1. Results in a cache miss for the [develocity-cache-miss-failsafe-jacoco-app](develocity-cache-miss-failsafe-jacoco-app) module

## Custom Cache Goal

### Problem 1: TypeScript Generator

Following the [Develocity guide for making other goals cacheable](https://docs.gradle.com/enterprise/maven-extension/#making_other_goals_cacheable)
and reviewing [Develocity build caching maven samples](https://github.com/gradle/develocity-build-config-samples/tree/main/build-caching-maven-samples) 
I am unable to make the [Maven TypeScript Generator plugin](https://github.com/vojtechhabarta/typescript-generator) cacheable.

1. Update [gradle-enterprise.xml](.mvn/gradle-enterprise.xml) and set the URL and any other necessary properties for the Develocity server
2. Run `./mvnw clean proces-classes`
   1. This allows the initial cache to be built
3. Run `./mvnw clean process-classes` again
   1. Results in a cache miss for the [develocity-cache-miss-typescript-generator](develocity-cache-miss-typescript-generator) module,
      specifically the `generate` goal
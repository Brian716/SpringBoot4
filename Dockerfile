FROM maven:3.8-amazoncorretto-17 as BUILDER
ARG VERSION=0.0.1-SNAPSHOT
WORKDIR /build/
COPY pom.xml /build/
COPY src /build/src/

RUN mvn clean package
COPY target/spring-boot-course-4-${VERSION}.jar target/application.jar

FROM amazoncorretto:17
WORKDIR /app/

COPY --from=BUILDER /build/target/application.jar /app/
CMD java -jar /app/application.jar
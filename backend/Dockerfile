# ELSE API — multi-stage (Apple container / OCI Always Free friendly)
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /src
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package  && JAR=$(ls target/else-api-*.jar | grep -v original | head -1)  && cp "$JAR" /src/else-api.jar

FROM eclipse-temurin:21-jre-jammy
LABEL org.opencontainers.image.source="https://github.com/abhiudayg/else"       org.opencontainers.image.title="else-api"       org.opencontainers.image.description="ELSE Spring Boot API"       org.opencontainers.image.licenses="MIT"

RUN apt-get update  && apt-get install -y --no-install-recommends curl  && rm -rf /var/lib/apt/lists/*  && useradd -r -u 10001 elseapp

WORKDIR /opt/else
COPY --from=build /src/else-api.jar /opt/else/bin/else-api.jar
RUN mkdir -p /opt/else/bin /opt/else/data  && chown -R elseapp:elseapp /opt/else

USER elseapp
ENV SPRING_PROFILES_ACTIVE=oci     SERVER_PORT=8081     JAVA_TOOL_OPTIONS="-Xms48m -Xmx160m -XX:+UseSerialGC -XX:MaxMetaspaceSize=96m"

EXPOSE 8081
HEALTHCHECK --interval=30s --timeout=5s --start-period=50s --retries=3   CMD curl -fsS http://127.0.0.1:8081/api/v1/health || exit 1

ENTRYPOINT ["java","-jar","/opt/else/bin/else-api.jar"]

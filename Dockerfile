FROM maven:3.8.4-jdk-8 AS MVN_BUILD

LABEL version 1.0 \
      description "Image for custom fixit application"

COPY . /code
RUN echo 'building the application' > rm -Rf /code/target && \
	cd /code/ && \
    mvn clean package

FROM openjdk:8u111-jre


COPY --from=MVN_BUILD /code/target/fixit-1.0-SNAPSHOT.jar /app.jar
COPY --from=MVN_BUILD /code/entrypoint.sh /entrypoint.sh

RUN groupadd -r appuser && useradd -r -g appuser appuser
RUN chmod +x /entrypoint.sh
USER appuser
ENV JAVA_OPTIONS=""

CMD ["/entrypoint.sh"]
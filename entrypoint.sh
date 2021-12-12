#!/bin/bash
set -e

java_args="${JAVA_OPTIONS}"

exec java -Djava.security.egd=file:/dev/./urandom -jar $java_args app.jar


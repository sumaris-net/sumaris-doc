#!/bin/bash

# Get to the root project
if [[ "_" == "_${PROJECT_DIR}" ]]; then
  SCRIPT_DIR=$(dirname $0)
  PROJECT_DIR=$(cd "${SCRIPT_DIR}/.." && pwd)
  export PROJECT_DIR
fi;

PROJECT_CHARSET=UTF-8
JAR_DIR="${PROJECT_DIR}/lib"
JAR_VERSION="1.2024.3"
JAR_FILE="${JAR_DIR}/plantuml-${JAR_VERSION}.jar"
JAR_URL="https://repo1.maven.org/maven2/net/sourceforge/plantuml/plantuml/${JAR_VERSION}/plantuml-${JAR_VERSION}.jar"

# Download the jar if need
if  [[ ! -f "${JAR_FILE}" ]]; then
  echo "Downloading PlantUML jar file: ${JAR_URL}..."
  mkdir -p $JAR_DIR
  wget -O $JAR_FILE ${JAR_URL}
  if [[ $? -ne 0 ]]; then
      echo "ERROR - Missing PlantUML JAR file at: $JAR_FILE"
      echo " Please download it manually: ${JAR_URL}"
      echo " and save it into the directory: ${JAR_DIR}"
      exit 1
    fi
fi;


echo "--- Converting all PlatUML files from ${PROJECT_DIR} into SVG..."
cd ${PROJECT_DIR}
java -Dfile.encoding=${PROJECT_CHARSET} -jar ${JAR_FILE} -tsvg "./**.puml" -charset "${PROJECT_CHARSET}" -progress -duration -nometadata
echo "Done"

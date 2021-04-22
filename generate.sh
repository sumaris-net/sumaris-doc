#!/bin/bash

PROJECT_DIR=`pwd`
JAR_DIR="${PROJECT_DIR}/lib"
JAR_FILE="${JAR_DIR}/plantuml.jar"
JAR_VERSION="1.2019.12"
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


echo Converting all PlatUML files from `pwd` into SVG...
java -jar lib/plantuml.jar -tsvg "./**.puml" -charset UTF-8 -progress -duration
echo "Done"

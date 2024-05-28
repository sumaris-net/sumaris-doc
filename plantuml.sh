#!/bin/bash


# Get to the root project
if [[ "_" == "_${PROJECT_DIR}" ]]; then
  SCRIPT_DIR=$(dirname $0)
  PROJECT_DIR=$(cd "${SCRIPT_DIR}" && pwd)
  export PROJECT_DIR
fi;

PROJECT_CHARSET=UTF-8
JAR_DIR="${PROJECT_DIR}/lib"
JAR_FILE="${JAR_DIR}/plantuml.jar"
JAR_VERSION="1.2024.3"
JAR_FILENAME="plantuml-${JAR_VERSION}.jar"
JAR_FILE="${JAR_DIR}/${JAR_FILENAME}"
JAR_URL="https://repo1.maven.org/maven2/net/sourceforge/plantuml/plantuml/${JAR_VERSION}/plantuml-${JAR_VERSION}.jar"

# Make sure jar exists
checkJarExists() {
  # Download the jar if need
  if  [[ ! -f "${JAR_FILE}" ]]; then
    echo "Downloading PlantUML jar file: ${JAR_URL}..."
    mkdir -p ${JAR_DIR}
    wget -O ${JAR_FILE} ${JAR_URL}
    if [[ $? -ne 0 ]]; then
        echo "ERROR - Missing PlantUML JAR file at: ${JAR_FILE}"
        echo " Please download it manually: ${JAR_URL}"
        echo " and save it into the directory: ${JAR_DIR}"
        exit 1
      fi
  fi;
}

generateSvg() {
  echo "Converting all PlatUML files from $(pwd) into SVG, using charset ${PROJECT_CHARSET}..."
  cd ${PROJECT_DIR} || exit 1
  java -Dfile.encoding=${PROJECT_CHARSET} -jar ${JAR_FILE} -tsvg "./**.puml" -charset "${PROJECT_CHARSET}" -progress -duration -nometadata
  echo "Done"
}

generatePng() {
  echo "Converting all PlatUML files from $(pwd) into PNG, using charset ${PROJECT_CHARSET}..."
  cd ${PROJECT_DIR} || exit 1
  java -Dfile.encoding=${PROJECT_CHARSET} -jar ${JAR_FILE} -tpng "./**.puml" -charset "${PROJECT_CHARSET}" -progress -duration -nometadata
  echo "Done"
}

case "$1" in
svg)
    checkJarExists
    generateSvg

    exit 0
;;

png)
    checkJarExists
    generatePng

    exit 0
;;

version)
    java -jar ${JAR_FILE} -version
    exit 0
;;


help)
    echo "Usage: $0 {svg|png|version|help}"
    exit 0
;;

*)
    $0 help
    exit 0
esac
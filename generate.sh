#!/bin/bash

BASEDIR=`pwd`
echo Converting PlatUML files from ${BASEDIR}..

echo "Converting all .puml files into SVG..."
mkdir -p $BASEDIR/dist
rm -rf $BASEDIR/dist/*

find . -name '*.puml' | while read FILE; do
    echo "Converting ${FILE}..."
    FILE_DIR=`dirname ${BASEDIR}/${FILE}`
    TARGET_DIR=`dirname ${BASEDIR}/dist/${FILE}`
    mkdir -p ${TARGET_DIR}

    # SVG conversion
    FILE_SVG=${FILE//puml/svg}

    java -jar lib/plantuml.jar -tsvg ${FILE}
    if [[ -f "${FILE_DIR}/class.svg" ]]; then
        mv "${FILE_DIR}/class.svg" "dist/${FILE_SVG}"
    else
        mv "${FILE_SVG}" "dist/${FILE_SVG}"
    fi
done

echo "Done"

#!/bin/bash

BASEDIR=`pwd`
echo Converting PlatUML files from ${BASEDIR}..

echo "Converting all .puml files into SVG..."
mkdir -p $BASEDIR/dist
rm -rf $BASEDIR/dist/*

find . -name '*.puml' | while read FILE; do
    echo "Converting ${FILE}..."
    mkdir -p `dirname ${BASEDIR}/dist/${FILE}`

    # SVG conversion
    FILE_SVG=${FILE//puml/svg}
    cat $FILE | docker run --rm -i think/plantuml > $FILE_SVG
    mv "${FILE_SVG}" "dist/${FILE_SVG}"

    # PDF conversion
    #FILE_PDF=${FILE//puml/pdf}
    #docker run --rm -v $PWD:/diagrams productionwentdown/ubuntu-inkscape inkscape /diagrams/$FILE_SVG --export-area-page --without-gui --export-pdf=/diagrams/$FILE_PDF &> /dev/null
    #mv "${FILE_PDF}" "dist/${FILE_PDF}"
done

echo "Done"

#!/bin/bash
# converts all puml files to svg

BASEDIR=`pwd`
echo Converting PlatUML files from ${BASEDIR}..

mkdir -p $BASEDIR/dist
rm -rf $BASEDIR/dist/*

find . -name '*.puml' | while read FILE; do
    echo Converting $FILE..
    FILE_SVG=${FILE//puml/svg}
    FILE_PDF=${FILE//puml/pdf}

    cat $FILE | docker run --rm -i think/plantuml > $FILE_SVG
    docker run --rm -v $PWD:/diagrams productionwentdown/ubuntu-inkscape inkscape /diagrams/$FILE_SVG --export-area-page --without-gui --export-pdf=/diagrams/$FILE_PDF &> /dev/null

    mkdir -p `dirname ${BASEDIR}/dist/${FILE_SVG}`
    mv "${FILE_SVG}" "dist/${FILE_SVG}"
    mv "${FILE_PDF}" "dist/${FILE_PDF}"
done

echo Done

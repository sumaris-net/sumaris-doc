#!/bin/bash
# converts all puml files to svg

BASEDIR=`pwd`
echo Converting PlatUML files from ${BASEDIR}..

mkdir -p $BASEDIR/dist
rm -rf $BASEDIR/dist/*

for FILE in $BASEDIR/model/*/*.puml; do
  echo Converting $FILE..
  FILE_SVG=${FILE//puml/svg}
  FILE_PDF=${FILE//puml/pdf}

  if [[ -f ${FILE} ]]; then
    cat $FILE | docker run --rm -i think/plantuml > $FILE_SVG
    docker run --rm -v $PWD:/diagrams productionwentdown/ubuntu-inkscape inkscape /diagrams/$FILE_SVG --export-area-page --without-gui --export-pdf=/diagrams/$FILE_PDF &> /dev/null
  fi
done
mv $BASEDIR/*.svg $BASEDIR/dist/
mv $BASEDIR/*.pdf $BASEDIR/dist/
echo Done

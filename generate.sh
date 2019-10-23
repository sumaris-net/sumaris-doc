#!/bin/bash
echo Converting all PlatUML files from `pwd` into SVG...
java -jar lib/plantuml.jar -tsvg "./**.puml" -charset UTF-8 -progress -duration
echo "Done"

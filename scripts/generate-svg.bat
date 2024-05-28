@echo off

cd ..

echo "Converting all PlatUML files from %~dp0 into SVG...
java -jar lib/plantuml-1.2024.3.jar -tsvg "./**.puml" -charset UTF-8 -progress -duration  -nometadata
echo Done
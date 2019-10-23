@echo off
echo Converting all PlatUML files from %~dp0 into SVG...
java -jar lib/plantuml.jar -tsvg "./**.puml" -charset UTF-8 -progress -duration
echo Done
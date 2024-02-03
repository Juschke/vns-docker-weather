#!/bin/bash

inputfile="raw-stations.txt"
outputfile="stations.txt"

if [ ! -f "$inputfile" ];then
	echo "Datei nicht gefunden: $inputfile"
	exit 1
elif [ -f "$outputfile" ];then
	echo "Die $outputfile existiert schon!"
	exit 1
fi

#Verarbeitung der Rohtabelle mit awk: outputfile = StationID,Stadt,Bundesland
awk 'NR > 1 {print $2,$7,$8 }' "$inputfile" | sort -k 2 > "$outputfile"

echo "Erfolgreich die Wetter-Stationen geladen"

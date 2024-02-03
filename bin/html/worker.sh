#!/bin/bash

# Eingabedatei
input_file="stations.txt"

# HTML-Datei
html_file="stations.html"

rm -rf $html_file
if [ ! -f "$input_file" ]; then
echo "Eingabedatei nicht gefunden: $input_file"
exit 1
fi

# HTML-Header
echo "<html><head><title>Stationen Auswahl</title></head><body stlye=""display:flex;margin:2 auto;""><h1 id="ausgabe">Herzlich Wilkommen</h1><select> 
" > "$html_file"

# Bash while read-Schleife, um Namen und IDs zu verarbeiten
while read -r id name bundesland; do
echo "<option onclick=\"test()\">$name</option>" >> "$html_file"
done < "$input_file"


echo "</select><div style='display:flex;gap:16px;align-items:center;background-color:lightgrey;'><h1>Temeperatur</h1><p>
<small "style='font-size:24px;padding:2rem;color:blue;'"" id="TP"">18</small>in Celsisus</p></div>" >> "$html_file"





# JavaScript-Funktion für die Anzeige der ID
echo "
<script>
function test(){
console.log("test");
}
function display(id, name, state) {
console.log("");
let ausgabe = document.getElementById('ausgabe');
ausgabe.innerHTML += id + " " + name + " " + state;
}
</script>" >> "$html_file"

echo "</body></html>" >> "$html_file"
echo "Link:--> http://localhost/$html_file"


#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteGaliciaPersonas.txt

beneficiario=$(sed -n '/Nombre beneficiario/{n;s/^ *\([A-Za-z ]*[A-Za-z]\).*/\1/p;}' /tmp/comprobanteGaliciaPersonas.txt)
fecha=$(sed -n '/Fecha/{n;s# *\([0-9]\{1,2\}\)\/\([0-9]\{1,2\}\)\/\([0-9]\{2,4\}\).*#\1-\2-\3#p;}' /tmp/comprobanteGaliciaPersonas.txt)
monto=$(sed -n '/Importe debitado/{n;s/^ *\([0-9$\.]*\),.*/\1/p;}' /tmp/comprobanteGaliciaPersonas.txt)
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteGaliciaPersonas.txt

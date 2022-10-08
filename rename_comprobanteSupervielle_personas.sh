#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteSuperviellePersonas.txt

beneficiario=$(sed -n '/Titular destino/s/^.*Titular destino: *\([A-Za-z]*.*[A-Za-z]*\) *$/\1/p' tmp/comprobanteSuperviellePersonas.txt)
fecha=$(sed -n '/Fecha/s/^.*Fecha y Hora: *\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\).*$/\1-\2-\3/p' /tmp/comprobanteSuperviellePersonas.txt)
monto=$(sed -n 's/^.*Importe: *\([0-9]*.*[0-9]*\)\..*$/\1/p' /tmp/comprobanteSuperviellePersonas.txt)
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteSuperviellePersonas.txt


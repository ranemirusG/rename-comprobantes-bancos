#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteProvinciaPersonas.txt

beneficiario=$(sed -n '/destinatario/s/^.*destinatario: *\([A-Za-z ]*[A-Za-z]\) .*$/\1/p' /tmp/comprobanteProvinciaPersonas.txt)
fecha=$(sed -n '/Fecha/s/^.*\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\).*$/\1-\2-\3/p' /tmp/comprobanteProvinciaPersonas.txt)
monto=$(sed -n '/Importe/s/.*Importe: *\($ [0-9]*\),.*$/\1/p' /tmp/comprobanteProvinciaPersonas.txt | sed -n 's/ //p')
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/handy-files/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteProvinciaPersonas.txt


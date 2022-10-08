#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteCiudadEmpresas.txt

beneficiario=$(sed -n 's/^.*TITULARES: *\([A-Za-z ]*[A-Za-z]\) .*$/\1/p' /tmp/comprobanteCiudadEmpresas.txt)
fecha=$(sed -n '/FECHA/s/^.*\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\).*$/\1-\2-\3/p' /tmp/comprobanteCiudadEmpresas.txt)
monto=$(sed -n 's/^.*IMPORTE: *\([0-9]*.*[0-9]*\),.*$/$\1/p' /tmp/comprobanteCiudadEmpresas.txt)
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteCiudadEmpresas.txt


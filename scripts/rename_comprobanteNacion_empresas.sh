#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteNacionEmpresas.txt

beneficiario=$(sed -n '/RECEPTOR/s/^.*RECEPTOR: *\([A-Za-z]*.*[A-Za-z]*\) *$/\1/p' tmp/comprobanteNacionEmpresas.txt)
fecha=$(sed -n '/FECHA/s/^.*\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\).*$/\1-\2-\3/p' tmp/comprobanteNacionEmpresas.txt)
monto=$(sed -n 's/^.*IMPORTE: *\([0-9]*.*[0-9]*\),.*$/$\1/p' /tmp/comprobanteNacionEmpresas.txt)
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteNacionEmpresas.txt


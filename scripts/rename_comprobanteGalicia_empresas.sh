#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteGaliciaEmpresas.txt

empresaEmisora=$(echo "Mi Empresa SA") # el nombre de la empresa emisora NO figura en el comprobante
beneficiario=$(sed -n 's/.*Beneficiario: \([A-Za-z].*[A-Za-z]\) *Importe.*/\1/p' /tmp/comprobanteGaliciaEmpresas.txt)
# Fecha de preparacion
fecha=$(sed -n 's/.*Fecha preparaci.n .*\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\).*$/\1-\2-\3/p' /tmp/comprobanteGaliciaEmpresas.txt)
newName=$(echo ${empresaEmisora}\_$fecha\_$beneficiario)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm  /tmp/comprobanteGaliciaEmpresas.txt

#!/bin/zsh
ps2ascii $1 > /tmp/comprobanteCiudadPersonas.txt

beneficiario=$(sed -n '/Destino/{n;s/^. *\([A-Za-z]*.*[A-Za-z]*\).*$/\1/p;}' /tmp/comprobanteCiudadPersonas.txt)
fecha=$(sed -n '/operaci.n/{n;s/^.*\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\).*$/\1-\2-\3/p;}' /tmp/comprobanteCiudadPersonas.txt)
monto=$(sed -n '/Importe/{n;s/^.*\($ [0-9]*.*[0-9]\{0,3\}\),.*$/\1/p;}' /tmp/comprobanteCiudadPersonas.txt) | sed -n 's/ //p')
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteCiudadPersonas.txt

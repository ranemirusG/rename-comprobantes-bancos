#!/bin/zsh
#TODO faltan nombres al menos en esta version de comprobante

ps2ascii $1 > /tmp/comprobanteHSBCpersonas.txt

fecha=$(sed -n 's/^.*Fecha *\([0-9 \/]*\).*$/\1/p' /tmp/comprobanteHSBCpersonas.txt | sed -n 's#\/#-#gp')
monto=$(sed -n 's/^.*debitar *ARS \([0-9]*.*[0-9]*\),.*$/$\1/p' /tmp/comprobanteHSBCpersonas.txt)
newName=$(echo $beneficiario\_$fecha\_$monto)
destino=$(echo ~/directorio/destino/) # elegir directorio destino

mv $1 ${destino}${newName}.pdf
rm /tmp/comprobanteHSBCpersonas.txt


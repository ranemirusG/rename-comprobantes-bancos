# Renombrar el comprobante de transferencias según su contenido.

Ejemplo
Al descargar el comprobante el nombre del archivo en el mejor de los casos puede ser algo así:

"TransferenciaTercero-[numeroDNIemisor]\_[fecha].pdf", en el peor algo más genérico como "comprobante.pdf", "download.pdf", etc.

Con estos scripts el nombre pasará a ser algo asi:

[nombre destinatario]\_[fecha]\_[$importe].pdf

Tener en cuenta que dependiendo si se es beneficiario u originante de la
transeferencia habra que ajustar el script. Por ejemplo: si soy yo quien recibe
quizás no me resulte tan útil incluirme en el nombre nuevo.

Para convertir de pdf a texto uso el comando ps2ascii de [Ghostscript](https://www.ghostscript.com).

La idea de este repositorio es incluir a todos los bancos argentinos, para subsanar una fricción más en el sistema bancario. Seguramente haya maneras más elegantes de hacerlo, en este caso fue una excusa para utilizar sed. Probablemente haga algunas versiones utilizando awk.

## Bancos:

* Banco Ciudad
* Banco Galicia
* Banco Nacion
* Banco Provincia de Buenos Aires
* HSBC
* Supervielle

## Uso:

`rename_comprobanteNombreBanco.sh comprobante.pdf`


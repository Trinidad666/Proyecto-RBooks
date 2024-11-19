# Router

## *Interfaz ens18*
*Propósito*: Conexión a redes externas (generalmente hacia Internet o redes fuera de la red local).
1. *dhcp4: false*
  * No utiliza DHCP, por lo que la dirección IP y otros parámetros de red se configuran manualmente.

2. *addresses:*
  * La dirección IP estática configurada es 100.77.20.38/24, lo que significa que pertenece a la red 100.77.20.0 con una máscara de subred /24 (equivalente a 255.255.255.0).

3. *nameservers:*
  * No se ha configurado ningún servidor DNS en esta sección. Esto puede ser un error o simplemente no está especificado en esta configuración.

4. *routes:*
  * Se define una ruta predeterminada con to: default, lo que indica que todo el tráfico que no coincida con rutas específicas en la tabla de enrutamiento será dirigido al gateway 100.77.20.1.

5. *Conclusión:*
  * La interfaz ens18 está configurada para la salida hacia redes externas (probablemente Internet). Todo el tráfico saliente que no pertenezca a la red local será enviado al gateway 100.77.20.1.

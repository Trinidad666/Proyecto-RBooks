# NGINX

## HTML

Nos conectamos a la MV de nuestra web desde una terminal de otro equipo con el comando(ssh -p 22 nombre@IP) y añadimos la contraseña: 
``
ssh -p 22 victorh@100.77.20.38
``
![image](https://github.com/user-attachments/assets/4adc5a9d-944b-4352-b6ca-f84208d12e4d)

Instalaremos el servidor web Nginx junto con su configuración como proxy inverso.

![image](https://github.com/user-attachments/assets/daf09daf-be0c-4365-88eb-b487c4a39d2c)

Si ingresamos la dirección IP de la máquina router, podremos verificar que el servidor NGINX está correctamente conectado a la red y nos muestra la página web predeterminada de NGINX.

![image](https://github.com/user-attachments/assets/a3f37442-cbd1-456a-aa79-3acf89011769)


Para crear nuestra propia página web, debemos acceder a la carpeta **/var/www/**, que es el directorio predeterminado en los sistemas Linux donde se almacenan los archivos de las páginas web servidas por un servidor web, como Nginx o Apache.

![image](https://github.com/user-attachments/assets/1e27e412-b0d5-4fd7-aeba-097a80280ba5)

Creamos una nueva carpeta llamada rbooks.com con el siguiente comando:
``
sudo mkdir /var/www/rbooks.com
``
![image](https://github.com/user-attachments/assets/8f6439d1-7726-4f3d-a840-48d5cafd84ed)
![image](https://github.com/user-attachments/assets/67a1ad21-cbf8-496a-98eb-5f8246517646)

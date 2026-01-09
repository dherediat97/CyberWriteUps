![CTF Image](/img/hackerlabs/thlpwn_1.png)

# Resolución del CTF ~ THLPWN

| Propiedad | Valor |
|---	|---	|
| Máquina        | THLPWN         |
| Entorno        | OVA Linux      |
| Dificultad     | Principiante   |
| Fecha          | 25/10/2025     |
| Tipo           | Red Team       |
| Autor Write-up | dherediat      |

#### 1º paso(Instalación y configuración): Una vez tengamos la OVA descargada, descomprimida y funcionando. OJO, muy importante que esté ambos equipos(el host atacante y el host objetivo) en la misma red. El autor de está máquina, nos ha dado una pista bastante importante: la IP de la maquina objetivo.

![First Step](/img/hackerlabs/thlpwn_2.png)

#### 2º paso(Enumeración de servicios): Este paso es el más importante, porque cada máquina para nosotros es desconocida, no sabemos qué servicios posee.

![Second Step](/img/hackerlabs/thlpwn_3.png)

> [!TIP]
> No hace falta tampoco tener un comando de nmap con todos los argumentos...

Ahora sabemos que tiene abierto http y ssh, intentaremos abrir una conexión HTTP con el navegador web.

#### 3º paso(Reconocimiento de servicios): Este paso es sencillamente para investigar lo que podemos hacer con lo poco que tenemos....

![Third Step](/img/hackerlabs/thlpwn_4.png)


¡Interesante! El autor del ctf nos está diciendo que el host con la conexión HTTP no funcionará, a no ser que no se habilite el virtual hosting.Investiguemos más...

![Fourth Step](/img/hackerlabs/thlpwn_5.png)

Si observamos bien en la línea 18 de la hoja de estilos de CSS de la web. Veremos que nos ha dado el host DNS, por lo tanto, debemos de configurar ahora en el archivo `/etc/hosts` dicha IP con su host para poder acceder.

![Fifth Step](/img/hackerlabs/thlpwn_6.png)

Y ahora, podremos acceder a dicha página: `http://thlpwn.thl/`. Veremos en dicha página web, que todos los enlaces están caídos menos uno.

![Sixth Step](/img/hackerlabs/thlpwn_7.png)

El enlace que funciona es el de `Downloads`, intentemos acceder a la url.

![Seventh Step](/img/hackerlabs/thlpwn_8.png)

Vemos que nos da como unas instrucciones para descargarnos dicho archivo. Procedemos a descargarlo.... 

Casualmente nos dicen que hagamos el comando `strings` en su página web. Lo haremos para ver su contenido.

> [!TIP]
> El comando `strings` extrae secuencias de caracteres que son entedibles para el humano

![Eighth Step](/img/hackerlabs/thlpwn_9.png)

Si nos fijamos bien, nos están proporcionando unas credenciales. ¿Serán del ssh? Vamos a probar...

![Ninth Step](/img/hackerlabs/thlpwn_10.png)

Así es, eran las credenciales del SSH y funcionan correctamente. Ahora tenemos acceso al servidor ssh, sin realizar un ataque de fuerza bruta hemos conseguido un acceso ilegítimo al host objetivo. Investiguemos por la carpeta actual y... ¡Bingo, Flag Encontrada!

![Tenth Step](/img/hackerlabs/thlpwn_11.png)

#### 4º Paso(Escalamiento de privilegios): Lógicamente no se dará acceso al usuario administrador(root), tendremos que averiguar por nuestra cuenta cómo podremos acceder. Yo personalmente tengo mi truco, hay muchos(sino funciona uno, se pasa a otro y así), pero con unas nociones básicas con este comando sabremos si podemos ejecutar la bash con el usuario `root`. Usamos el comando `cat /etc/passwd/` sí la última fila contiene `/bin/bash/` en `thluser` se puede acceder al usuario root. 

> [!TIP]
> En el caso de que no tuviera acceso, podríamos mirar otros usuarios que estuvieran en este listado.

![Twelfth Step](/img/hackerlabs/thlpwn_12.png)

Usamos el comando `sudo /bin/bash` para convertirnos en superusuario.

![Thirdteenth Step](/img/hackerlabs/thlpwn_13.png)

¡Y finalmente somos root! Ahora nos toca ver la flag del usuario `root`. 

> [!TIP]
> Ejecutamos algún comando para mostrar el contenido de ficheros como son `cat/less/more` y... 

![Foutteenth Step](/img/hackerlabs/thlpwn_14.png)

# ¡Enhorabuena, CTF Completado!
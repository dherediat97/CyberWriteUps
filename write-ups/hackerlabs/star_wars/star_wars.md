<img src="https://github.com/dherediat97/CyberWriteUps/blob/main/img/hackerlabs/star_wars.png" width="300" height="200">

# Resolución del CTF

| Propiedad | Valor |
|---	|---	|
| Máquina | Horizon |
| Entorno | OVA Linux      |
| Dificultad | Profesional   |
| Fecha | 07/03/2026     |
| Tipo | Seguridad Ofensiva, Linux |
| Autor | dherediat      |

### Iniciamos la maquina descargada, y notamos que el creador del CTF nos ha proporcionado la IP de la máquina objetivo de este CTF. En mi caso es la ``10.0.2.155``

![](/img/hackerlabs/star_wars_1.png)

### Vemos que la máquina objetivo tiene ``3 servicios abiertos``, vamos a echar un vistazo al servicio web. Para ello, abrimos el navegador predeterminado por defecto.

![](/img/hackerlabs/star_wars_2.png)

### Aqui nos introduce a la ``misión`` que tenemos que hacer en este CTF. Le damos a ``Sí, deseo aceptar la misión``. Hay un detalle importante, y es que sabemos nuestro código de ``cadete`` que es el ``7985``. Aunque todo el mundo nos llama ``Pirri``.

![](/img/hackerlabs/star_wars_3.png)

### Nos da más detalles sobre la narrativa de está máquina y el lugar(``Vardos``) donde continúa la siguiente parte.

![](/img/hackerlabs/star_wars_4.png)

### Aquí, podremos ver un panel como de un holo comunicador, como si fuera una conexión entrante con la república galáctica.

![](/img/hackerlabs/star_wars_5.png)


### Sí le damos a ``Iniciar Conexión``, nos dará una lista de mensajes y de audios. De todo ello, lo más importante es:
- La ``General Iden Versio`` TODAVÍA no sé sabe nuestra identificación.
- Si fracasamos podemos morir.

![](/img/hackerlabs/star_wars_6.png)

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbTBoZ3JwY3RzczlsaWtqYnM5enA0c2QydTVia2gydnU5ZXR3Nmd6YyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xUNd9O2jkK4GPCWyZ2/giphy.gif)


### Es importante saber, que el creador se ha basado en una narrativa real de ``Star-Wars / La guerra de las Galaxias``, con nombres ubicaciones y lugares correctos.

![](/img/hackerlabs/star_wars_7.png)

### En el código fuente vemos un comentario, y parece ser ``Yoda``, en una codificación algo extraña.

![](/img/hackerlabs/star_wars_10.png)

![](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbjdubmY4M3UydXBsaWJydzU5ejBqbWZyYW1yNWcwb3l3dDV0Z3g1YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/zQhFEBrX6plKg/giphy.gif)

### Le preguntamos a ChatGPT, en caso de que no sepamos que codificación se trata. Y sí, efectivamente se trata de ``BrainFuck``. ChatGPT parece que no nos puede ayudar a descifrar el código encriptado, buscaremos en ``Google`` páginas para desencriptar ``BrainFuck``. La primera que encontramos es ``dcode.fr``, usemos esa web. 

![](/img/hackerlabs/star_wars_11.png)

### Nos da una contraseña en claro, suponemos que es el acceso al ssh, ya que no hay otro servicio abierto, nos hace falta saber el usuario, ya que la máquina es totalmente con narrativa no nos valdrá uno cualquiera.

![](/img/hackerlabs/star_wars_12.png)

> [!TIP]
> Los códigos de identificación de los Stormtroopers (soldados de asalto) en Star Wars constan de dos letras seguidas de tres o cuatro dígitos, como «TK-421».

### Al enviarnos muchos mensajes, podemos pensar que la comunicación de este holo-comunicador es direccional, pero tenemos que probar si de verdad es también bidireccional. Podemos observar aquí, el código fuente de la parte del websocket en la web.

![](/img/hackerlabs/star_wars_13.png)

### Nos copiamos y pegamos la conexión del websocket y probamos términos como: ``auth``, ``login``, ``secret``, ``pass``, ``password``. Así podremos saber a que usuario corresponde nuestra contraseña.

![](/img/hackerlabs/star_wars_14.png)

### Nos da una parte de un JWT, tanto la parte del ``Bearer`` como la del ``Secret``. Probemos a ver que contiene en ``jwt.io``.

![](/img/hackerlabs/star_wars_15.png)

### Exactamente, es nuestra identificación, podemos ahora conectarnos usando ssh. El creador de este CTF nos ha guíado para obtener estos datos, sino hubiera sido así y usamos en cuyo caso, ``hydra`` con ``rockyou`` nunca lo podríamos haber sacado las credenciales.

![](/img/hackerlabs/star_wars_16.png)

### Accedemos con éxito al usuario indicado.

![](/img/hackerlabs/star_wars_17.png)

### Vemos e investigamos que contiene dentro. Y parece que nos han envíado un correo ``galáctico``. Lo abrimos, y vemos que nos dejaron los detalles en el archivo ``.notas``. Lo visionamos, para saber que contiene y vemos que es una hoja de ruta, como una lista de objetivos. Primer paso: Disfrazarnos de un ``Wookie(Gungi)``.

![](/img/hackerlabs/star_wars_18.png)

![](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExZHlpY2pwOTFyaGJkYWE4ajJqdjRkYTQwOTgyeGtyeGtuODZuNHNtayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/loQBSxzBuYQLK/giphy.gif)


### Usamos el comando ``sudo -l`` y vemos que tiene un binario que permite pivotar al usuario ``gungi``. Este es nuestro primer paso.

![](/img/hackerlabs/star_wars_19.png)

### Siguiente paso, saber dónde esta el ADN de dicho Wookie. Parece que tuvo problemas con los ``Frangawl``, y también, si buscamos este nombre en una wikia de ``Star-Wars`` podemos ver que tuvo un amor llamado ``Julia``, justamente como se llama el binario.

![](/img/hackerlabs/star_wars_20.png)

### Antes de nada, tenemos que ir a saber donde se encuentra ese ADN. Esta parte es algo compleja, ya que debes de saber un poco las ubicaciones de esta narrativa que es especial.

![](/img/hackerlabs/star_wars_21.png)

### Googleamos ubicaciones, planetas y lugares. Con esta lista de sitios hacemos una ``wordlist custom``.

![](/img/hackerlabs/star_wars_22.png)

### Usando ``gobuster`` y vemos que hay directorios ocultos de algunos de los planetas/ubicaciones que apuntamos.

![](/img/hackerlabs/star_wars_23.png)

### Justamente donde debería estar ``Han Solo`` en la  ``Cantina``. Si nos dimos cuenta, para poder usar el binario ``julia`` debemos de usar el usuario ``han_solo``. 
### Vamos por el camino correcto, él siempre sabe donde está todo, vamos a hablar con él.

![](/img/hackerlabs/star_wars_24.png)

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExbmY1N2NjcmFrZ3I2ZWE1b3RycGIwMTJibmR6ZzJmNW5xN3dkMDZlMiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/w3rzrgL8jh7eo/giphy.gif)

### Nos dice que si aceptamos el trato, nos dará el mapa, así que con esas vamos a aceptar.

![](/img/hackerlabs/star_wars_25.png)

### Nos lleva a ``Kamino``, justamente es donde se recogen multitud de ``ADNs``, vamos bien. Le damos a ``Sí, quiero entrar``.

![](/img/hackerlabs/star_wars_26.png)

![](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMnI0d2o0aWd2cm13a2JvMWJnbW0za3BjcW1zMmI3eGpyOHJrNXZzaiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/181OUQHOCfde0/giphy.gif)

### Al parecer en el texto que nos muestra, hay algo oculto entre líneas.... Habla de indexar, y de tablas, ya sabemos que hay BBDD y SQL por aquí.

![](/img/hackerlabs/star_wars_27.png)

### Vemos el código fuente y nos damos cuenta que está esto oculto.

![](/img/hackerlabs/star_wars_28.png)
![](/img/hackerlabs/star_wars_29.png)

###  Procedemos en nuestra máquina host, a usar ``sqlmap`` para obtener datos. Ya que el tema va de ``jedis``, ``padawan`` y ``sith``, podemos probar a que la petición del ``sqlmap`` contenga esa tabla. En la imagen de arriba, se puede ver como ``Yoda`` una vez más nos quiere guiar por el camino y nos dice que el siguiente jedi que tenemos que contactar es ``Obi Wan Kenobi``.

![](/img/hackerlabs/star_wars_30.png)

### Vemos que el creador nos dejo un ``bunny hole``. No es ninguna pista, solo nos afirma que no nos sirve la ``fuerza bruta`` aquí.

![](/img/hackerlabs/star_wars_31.png)

![](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExdGhjdDZ6ZHViZm4zODA0ZDN4dW1qYXY1dDV3eDN1MnFkbnM4MmhueiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/esQlNLP9B4MqJznbby/giphy.gif)

> [!TIP]
> ¡No había nada ``importante`` oculto! :)


### Para pivotar a ``han_solo`` debemos de usar ``julia`` y con ella debemos de saber que el parametro que espera es en base64.

![](/img/hackerlabs/star_wars_32.png)

### Probamos algo sencillo como ``whoami``. Y si, nos da ``han solo``.

![](/img/hackerlabs/star_wars_33.png)

### Ahora probaremos a invocar la shell interactiva con ``/bin/bash`` y podemos pivotar a ``han_solo``.

![](/img/hackerlabs/star_wars_34.png)

### Para pivotar de ``han_solo`` a ``obi`` nos hace falta usar el binario ``find``. Usaremos el binario, tal y como lo muestra en [GTFObins](https://gtfobins.org/gtfobins/find/#shell)

![](/img/hackerlabs/star_wars_35.png)

### Miramos si tiene algo que nos de pista. Pero en este caso nada, seguimos pivotando.

![](/img/hackerlabs/star_wars_36.png)

### En este caso, es más que sencillo de lo que parece, arrancamos el comando ``man`` y otra vez en ``man``.

![](/img/hackerlabs/star_wars_37.png)

### Ya dentro de de la ayuda interactiva escribimos ``!/bin/bash`` y podemos obtener el acceso a ``anakin``. Ya que el padawan de ``Obi Wan Kenobi`` fue ``Anakin Skylwaker`` está correctamente narrado en este caso.

![](/img/hackerlabs/star_wars_38.png)

### Anakin ya no tiene más, tenemos que buscar binarios o ejecutables que nos pueda llevar a otro usuario o directamente ya a ``root``.

![](/img/hackerlabs/star_wars_39.png)

### Vemos que hay dos usuarios que no entramos: ``Vader`` y ``Luke``. Ya que somos ``Anakin`` el más cercano a nosotros ahora es ``Vader``.

![](/img/hackerlabs/star_wars_40.png)

### Como están los dos, podemos mirar si hay binarios que contegan la palabra ``dark`` referenciandosé al ``Cambio de Anakin al Lado Oscuro``.

![](/img/hackerlabs/star_wars_41.png)

### Vemos que sí, sin mucho misterio ya somos ``root``.

![](/img/hackerlabs/star_wars_42.png)

### Lo que pasa aquí es que ``Vader`` es el ``Señor Oscuro de los Sith``. Por lo tanto, solamente con ``root`` podemos acceder a él.

![](/img/hackerlabs/star_wars_43.png)


### Tarea Opcional:

![](/img/hackerlabs/star_wars_44.png)

> [!TIP]
> Entra en el directorio oculto que no nos ha hecho falta ver y recibirás un regalo secreto. 



# ¡Felicidades! ¡La fuerza te acompañó y pudistes acabar este CTF con éxito!

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2s2emgzcDg4d2FtczAyNDdzcW83dzc5Z2t2cjF0azQ0M2RjMTB3ciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/GIIC4jmmUlXZS/giphy.gif)


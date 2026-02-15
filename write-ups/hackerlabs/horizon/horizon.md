![CTF Image](/img/hackerlabs/horizon.png)

# Resolución del CTF

| Propiedad | Valor |
|---	|---	|
| Máquina | Horizon |
| Entorno | OVA Linux      |
| Dificultad | Avanzada   |
| Fecha | 20/12/2025     |
| Tipo | Seguridad Ofensiva, OSINT, Forense |
| Autor | dherediat      |

### Primer paso, iniciamos la maquina descargada.

![First Step](/img/hackerlabs/horizon_1.png)

### Luego, vemos el contenido del `Escritorio`. Leemos las `instrucciones.md` para saber que debemos o no de hacer.

![](/img/hackerlabs/horizon_2.png)

> [!TIP]
> Michael E. López Alegría nos remarca, que tenemos que firmar el documento.


![](/img/hackerlabs/horizon_author.png)

### Firmemos ahora dicho documento usando LibreOffice Draw. Vale cualquier firma, cuando terminemos sobrescribimos los cambios en el mismo archivo.

![](/img/hackerlabs/horizon_3.png)

### Exportamos encima del archivo.

![](/img/hackerlabs/horizon_4.png)

### Le damos a `Yes` indicando que queremos sobrescribirlo.

![](/img/hackerlabs/horizon_5.png)

### Y mágicamente(o no) ha aparecido una carpeta que se indicó en las `instrucciones.md`. Nos explica que el `.wav` tiene algo oculto, procedamos a la prueba de carbono(es un símil).

![](/img/hackerlabs/horizon_6.png)


### Abriendo la muestra con Audacity, podemos observar, que parece ruido espacial, pero no hay nada oculto `a simple vista`.


![](/img/hackerlabs/horizon_7.png)

> [!TIP]
> Por defecto el audio esta desactivado, para escuchar las muestras de audio, podemos activarlo en VBox.

### Podemos ver si hay algun archivo oculto, pero no, no hay nada
![](/img/hackerlabs/horizon_8.png)


### Ya que tenemos acceso a este laboratorio, no es mala idea ver que paquetes tiene o no instalado, en el campo de ocultar datos en wav, hay muchas `tools`, pero las más famosas son:
- Stegseek
- Steghide

![](/img/hackerlabs/horizon_9.png)

### Vemos que tiene instalado stegseek, y steghide parece que se desinstaló. Muy interesante, a nuestro compañero investigador se le olvidaría borrar stegseek. Vamos a usarlo:

![](/img/hackerlabs/horizon_10.png)

![](/img/hackerlabs/horizon_11.png)

> [!TIP]
> ¡Bingo! Tiene un mensaje oculto, este mensaje corresponde a la respuesta del cuestionario Nº 1.


### Antes de nada, vamos a buscar que tiene guardado en los marcadores, que nos compartió el, quizas haya algo escondido....
![](/img/hackerlabs/horizon_12.png)


### Parece que no tiene nada guardado, vamos a probar a escanearla con nmap en nuestra máquina atacante.

![](/img/hackerlabs/horizon_13.png)
![](/img/hackerlabs/horizon_14.png)

### La encontramos, procedemos a navegar a donde nos redirige el nmap

![](/img/hackerlabs/horizon_17.png)

> [!TIP]
> ¡2º y 3º pregunta del cuestionario descubierta!


### Para la siguiente pregunta debemos pensar en la narrativa, sabemos que es el blog de Michael López Alegría, busquemos quién es está persona.
![](/img/hackerlabs/horizon_18.png)

### Quizás sea algo como su Primer vuelo espacial o algo más personal
> [!TIP]
> ¡4º pregunta del cuestionario acertada! Si así es: era la fecha de nacimiento en formato ddMMYYYY. Pista: El nombre de usuario es el usuario más común desde que existe Internet.

### Descubrimos un mensaje que nuestro querido investigador nos oculto en lenguaje morse, trataremos de decodificarla.
![](/img/hackerlabs/horizon_19.png)


### Muy interesante, descubrimos la contraseña de root
![](/img/hackerlabs/horizon_20.png)

> [!TIP]
> ¡5º pregunta del cuestionario acertada! Recuerda: en MAYÚSCULAS.

### Al principio(en `instrucciones.md`) nos decia que habia logs de la ESA, procedemos a buscar algún rastro oculto.
![](/img/hackerlabs/horizon_21.png)
![](/img/hackerlabs/horizon_22.png)
![](/img/hackerlabs/horizon_23.png)

### Procedemos a mirar si tiene esa muestra de audio datos ocultos.
![](/img/hackerlabs/horizon_24.png)

> [!TIP]
> ¡6º pregunta del cuestionario acertada! 

![](/img/hackerlabs/horizon_25.png)
# Mision Completed!

![](https://media1.tenor.com/m/CYnKyiPDAboAAAAC/dog-flying-in-space-station-dog-floating.gif)
# ¡Enhorabuena, has conseguido averiguar el misterio(y no has muerto en el intento) de esta mision espacial!

> [!TIP]
> Nuestros amigos extraterrestres nos dejaron un vídeo, corre a verlo en `/root`?
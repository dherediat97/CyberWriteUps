![CTF Image](/img/hackerlabs/topodns_1.png)

# Resolución del CTF

| Propiedad | Valor |
|---	|---	|
| Máquina        | El Topo DNS    |
| Entorno        | OVA Linux      |
| Dificultad     | Principiante   |
| Fecha          | 12/11/2025     |
| Tipo           | Forense        |
| Autor Write-up | dherediat      |

### Credenciales de Acceso:
- Usuario: auditor
- Contraseña: auditor

### Primer paso, iniciamos sesión con las credenciales que nos han proporcionado:

![Second Step](/img/hackerlabs/topodns_2.png)

> [!TIP]
> Es un CTF orientado a forense, por lo tanto, arrancamos la máquina.

### Luego, nos fijamos en la primera pregunta: ¿Qué dirección IP externa sirvió el _stager_ `p.sh` al servidor web?

### Filtramos en ese archivo y filtraremos con `grep` el termino 'p.sh' y nos da la IP que es...

![Thid Step](/img/hackerlabs/topodns_3.png)

### Para saber el nombre del archivo....

![Fourth Step](/img/hackerlabs/topodns_4.png)

#### Después de una larga investigación(usando el comando `more` en el archivo `access_log`) hemos descubierto el nombre del archivo.

> [!TIP]
> Esta es la parte más difícil(desde mi punto de vista), debido al ruido que tiene los logs. Ruido que es un uso cotidiano de la plataforma, es una buena manera de habituarnos a no estresarnos con tanta información.

### Para saber: ¿Cuál es el FQDN de la primera consulta de _beaconing_ de C2 observada en los logs?

![Fifth Step](/img/hackerlabs/topodns_5.png)

> [!TIP]
> Usaremos el comando `more dns.log`. Lo recomiendo en temas de forense, todavía más si como en este caso el host donde están los logs es sin interfaz gráfica. Cada maestro tiene su librillo, como dice el dicho, sólo es mi recomendación personal.

### ¡Siguiente pregunta! ¿Cuál es el dominio (solo el dominio, sin subdominios de datos) usado para exfiltrar el fichero shadow?

![Sixth Step](/img/hackerlabs/topodns_6.png)

> [!TIP]
> Seguimos investigando el dns.log.

### Última parte, resolver el inquientante misterio del topo. 

![Seventh Step](/img/hackerlabs/topodns_7.png)

### Con esto hemos resuelto: la ip del atacante, cómo pudo acceder, el punto de entrada, por dónde pivoto el atacante y las credenciales que uso luego.

![gif](https://c.tenor.com/ul_Bdn13nnQAAAAd/tenor.gif)

# ¡Buen trabajo, CTF Completado!
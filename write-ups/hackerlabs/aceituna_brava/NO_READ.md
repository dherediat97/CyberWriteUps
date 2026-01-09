![CTF Image](/img/hackerlabs/aceituna_brava_1.png)

# Resolución del CTF ~ Aceituna Brava

<details>

<summary>Descripción CTF</summary>

| Propiedad | Valor |
|---	|---	|
| Máquina        | Aceituna Brava        |
| Entorno        | OVA Linux             |
| Dificultad     | Experto :bomb:        |
| Fecha          | 16/06/2025            |
| Tipo           | Reversing             |
| Autor          | murrusko              |
| Autor Write-up | dherediat             |

</details>

### 1º paso(Instalación y configuración): Una vez tengamos la OVA descargada, descomprimida y funcionando. OJO, muy importante que esté ambos equipos(el host atacante y el host objetivo) en la misma red. El autor de está máquina, nos ha dado una pista bastante importante: la IP de la maquina objetivo.

![First Step](/img/hackerlabs/aceituna_brava_2.png)

### 2º paso(Enumeración de servicios): Este siempre será uno de los pasos más importantes, porque cada máquina para nosotros es desconocida, no sabemos qué servicios posee.
![Pre Second Step](/img/hackerlabs/aceituna_brava_2_1.png)

Me di cuenta de que cargaba en la web una de las IP y era estática. La web cargará, pero sin estilos.También los enlaces estarán cambiados,por lo tanto tendremos que hacer este comando para que redireccione a una IP inexistente y asi todo fluya como debería.

![Third 1/3 Step](/img/hackerlabs/aceituna_brava_3_1.png)

Hacemos fuzzing, nos damos cuenta de algunas carpetas que están expuestas de forma pública.

![Third 2/3 Step](/img/hackerlabs/aceituna_brava_3_2.png)

Tambien podemos hacer enumeración con nmap, y podremos ver más información, como posibles vulnerabilidades que se podrían explotar.

![Third 3/3 Step](/img/hackerlabs/aceituna_brava_3_3.png)

Durante mucho tiempo buscando en las carpetas, pensamos si Chamilo tiene alguna vulnerabilidad, y sí tiene esa [vulnerabilidad](https://nvd.nist.gov/vuln/detail/CVE-2023-4220). Lo que conlleva, que podemos subir cualquier archivo a al carpeta indicada en la vulnerabilidad(/main/inc/lib/javascript/bigupload/inc/bigUpload.php).

### 3º paso(Reconocimiento de servicios): Este paso es sencillamente para investigar lo que podemos hacer con lo poco que tenemos....

Procedemos a explotar esa vulnerabilidad. Creamos un archivo php tonto, que lo que hace es mostrar el phpInfo();.

![Fifth Step](/img/hackerlabs/aceituna_brava_5_1.png)
![Fifth Step](/img/hackerlabs/aceituna_brava_5_2.png)

Nos damos cuenta de que no se puede hacer un shell inverso, ya que esta bloqueado la manera de conectarse, y de hecho cuando aprovechamos esta vulnerabilidad y subimos un archivo escrito en PHP sobre shell inverso, la propia plataforma de Chamilo nos borra el archivo.


Desde mi punto de vista, es más sencillo crear un usuario de test, y ya con ese podemos pivotar con el usuario admin.

![Sixth Step](/img/hackerlabs/aceituna_brava_6_1.png)

Usamos este archivo para la subida de este archivo en el servidor y posterior ejecución.

![Sixth Step](/img/hackerlabs/aceituna_brava_6_2.png)

Ya que la vulnerabilidad esta en nuestra versión, que lo podréis comprobar si váis a `/documentation`,  usamos `curl` para subir el archivo y aprovechamos que el método [postUnsupported](https://github.com/chamilo/chamilo-lms/commit/3b487a55076fb06f96809b790a35dcdd42f8ec49#diff-fd99273a645b87ef01cb9adce9809e733f06690480f751f81ca3c296f847f1a8L17-L299) sigue existiendo.

![Sixth Step](/img/hackerlabs/aceituna_brava_6_3.png)

### 4º Paso(Escalamiento de privilegios):
En Proceso

![Thirdteenth Step](/img/hackerlabs/aceituna_brava_13.png)

¡Y finalmente somos root! Ahora nos toca ver la flag del usuario `root`. 

![Foutteenth Step](/img/hackerlabs/aceituna_brava_14.png)

# ¡Enhorabuena, CTF Completado! -->
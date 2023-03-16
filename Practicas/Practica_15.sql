select * from PELICULAS_COMPLETO;

--Parte 1
select upper(titulo) || ': crítica de '|| upper(substr(NOMBRE_CRITICO,1,1))||'.'||APELLIDO_CRITICO||', '
           ||to_char(FECHA,'fmday dd "de" month "de" yyyy')||', '
           || decode(ESTRELLAS,1,'*',2,'**',3,'***',4,'****',5,'*****') as Criticas_Realizadas
from PELICULAS_COMPLETO;

--Parte 2
select distinct titulo,DURACION
from PELICULAS_COMPLETO
where duracion>=interval '1:15' hour to minute and duracion<=interval  '1:45' hour to minute
order by titulo asc;

--Parte 3
select initcap(TITULO),
      trim(extract(hour from DURACION)*60 + extract(minute from DURACION)) as Minutos,
       NOMBRE_CRITICO as Nombre,
       APELLIDO_CRITICO as Apellido,
       FECHA
from PELICULAS_COMPLETO
where to_char(fecha)>=to_date('1-1-2018','dd-mm-yyyy') and to_char(fecha)<=to_date('31-12-2018','dd-mm-yyyy');

--Parte 4
select distinct TITULO
from PELICULAS_COMPLETO
where PAISES like '%Estados Unidos%' and lengua!='Inglés';

--Parte 5
select distinct TITULO,regexp_count(PAISES,',')+1||' paises' as Producción
from PELICULAS_COMPLETO
order by titulo asc;

--Parte 6
select distinct titulo, PAISES
from PELICULAS_COMPLETO
where regexp_like(PAISES,'[[:alpha:]] [[:alpha:]]') and not regexp_like(paises,'Estados Unidos');

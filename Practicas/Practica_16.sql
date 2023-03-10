select * from TRENES_COMPLETO;

--Parte 1
select COD_TREN,
       'De '||initcap(LOCALIDAD_INICIO)||' de '||initcap(LOCALIDAD_FIN) as Recorrido,
       to_char(HORA_INICIO,'hh24:mi')||'-'||to_char(HORA_FIN,'hh24:mi') as Inicio_Fin
from TRENES_COMPLETO;

--Parte 2
select COD_TREN,decode(substr(COD_TREN,1,2),
    'RR','Regional',
    'ES','Estrella',
    'TA','Talgo',
    'AV','Ave',
    'RE','Regional Express') as Tipo_Tren,
    to_number(substr(COD_TREN,3)) as Numero
from TRENES_COMPLETO;

--Parte 3
select COD_TREN,DESCRIPCION
from TRENES_COMPLETO
where not regexp_like(upper(DESCRIPCION),('TURISTA|LUJO'));

--Parte 4
select COD_TREN,DIAS_PASO,nvl(regexp_count(DIAS_PASO,',')+1,0) as Total_Dias
from TRENES_COMPLETO
order by Total_Dias desc;

--Parte 5
select COD_TREN,
       DIAS_PASO
from TRENES_COMPLETO;

--Parte 6
select COD_TREN,LOCALIDAD_INICIO,LOCALIDAD_FIN, to_char(HORA_INICIO,'hh24') as Inicio,to_char(HORA_FIN,'hh24') as Fin,
       case when HORA_INICIO<HORA_FIN
                then extract(hour from HORA_fin)- extract(hour from HORA_inicio)
else
    extract(hour from HORA_fin) - extract(hour from HORA_INICIO)+24
end as Duración_en_Horas
from TRENES_COMPLETO
where LOCALIDAD_INICIO is not null
order by Duración_en_Horas desc,1;
